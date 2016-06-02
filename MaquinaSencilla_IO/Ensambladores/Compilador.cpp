#include <cassert>
#include <cctype>
#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <vector>
#include <map>
#include <math.h>
#include <stdlib.h>

using namespace std;
map<string,string> instructions_codes;

//funciones auxiliares para conversion de datos(debe haber mejores pero estas andan :) )
bool es_variable(string a){
    return isalpha(a[0]);
}

bool es_direccion(string a){
    return isalnum(a[0]);
}

bool es_constante(string a){
    return a[0]=='@';
}

string int_a_binario(int num,int tam_binario){
    string resultado="";
    int mascara = 1 << (tam_binario - 1);
    for (int i=0; i<tam_binario; i++) {
        if(num & mascara)
            resultado = resultado+ "1";
        else
            resultado = resultado+ "0";
        mascara >>= 1;
    }
    return resultado;
}

string int_a_string(int numero){
    string resultado;
    stringstream convert;
    convert << numero;
    resultado = convert.str();
    return resultado;
}

int string_a_int(string a){
    return atoi(a.c_str());
}

//ahora como tengo definido donde voy a ubicar las variables, hago la pasada final
vector<string> parser_codigo(vector<string> codigo_limpio,map <string,int> etiquetas,map <string,int> variables,map <string,int> constantes){
	vector<string> program;
	int posicion_variables=codigo_limpio.size();
	int posicion_constantes=posicion_variables+variables.size();
    program.resize(posicion_constantes+constantes.size());
	for(unsigned int i=0;i<codigo_limpio.size();i++){
        string comando=codigo_limpio[i].substr(0,codigo_limpio[i].find(' '));//busca instruccion
        string instruccion_asm=instructions_codes.find(comando)->second; //pone los ultimos digitos con el codigo
        string line=codigo_limpio[i].substr(codigo_limpio[i].find(' ')+1);//lineas con operandos
        string primer_op=line.substr(0,line.find(',')); //busca primer operando
        string segundo_op=line.substr(line.find(',')+1); //busca segundo operando
        if((comando=="IN")||(comando=="OUT")){
                primer_op=int_a_binario(atoi(primer_op.c_str()),5); //pone los digitos del medio con el puerto designado
        }
        else
            if(comando=="BEQ"){
                primer_op="00000";                       //pone  los digitos del medio en 111111 total no importa ahora
            }
            else{
                if(comando=="MOV"||comando=="ADD"||comando=="CMP"){
                    map<string,int>::iterator it=etiquetas.find(primer_op);
                    if(it!= etiquetas.end()){  
                        primer_op=int_a_binario(it->second,7);
                    }
                    else
                        if(es_variable(primer_op)){
                            primer_op=int_a_binario((posicion_variables+variables.find(primer_op)->second),7);
                        }
                        else
                            if(es_constante(primer_op)){
                                int posicion_memoria=posicion_constantes+constantes.find(primer_op)->second;
                                primer_op=primer_op.substr(1);
                                program[posicion_memoria]=int_a_binario(string_a_int(primer_op),16);
                                primer_op=int_a_binario(posicion_memoria,7);

                            }
                            else{
                                primer_op=int_a_binario(string_a_int(primer_op),7);
                            }
                        }
            }
        //si es una etiqueta
        map<string,int>::iterator it=etiquetas.find(segundo_op);
        if(it!= etiquetas.end()){ 
            segundo_op=int_a_binario(it->second,7);
        }
        else
            if(es_variable(segundo_op)){
                segundo_op=int_a_binario((posicion_variables+variables.find(segundo_op)->second),7);
            }
            else
                if(es_constante(segundo_op)){
                    int posicion_memoria=posicion_constantes+constantes.find(segundo_op)->second;
                    segundo_op=segundo_op.substr(1);
                    program[posicion_memoria]=int_a_binario(string_a_int(segundo_op),16);
                    segundo_op=int_a_binario(posicion_memoria,7);
                }
                else{
                        segundo_op=int_a_binario(string_a_int(segundo_op),7);
                    }
        //pone  los primeros digitos con D y arma toda la instruccion
        program[i]=instruccion_asm+primer_op+segundo_op;
	}
    //relleno las "variables" en cero para que no chille nadie del simulador
    for(int j=0;j<variables.size();j++){
        program[posicion_variables+j]=int_a_binario(0,16);
    }
	return program;
}

//escribir el archivo de salida
int escribir_output(string archivo, vector<string> programa){
    ofstream output_file_fstream(archivo.c_str());
    if(output_file_fstream.fail()){
        cerr << "No se pudo crear archivo de salida" << std::endl;
        return -2;
    }
    for (int i=0;i<programa.size();i++)
        output_file_fstream<<programa[i]<<endl;
    output_file_fstream.close();
    cout<<"archivo generado "<<archivo<<endl;
    return 0;
}

//chamuyo para que no quede un programa hiper largo (podria poner seguridades pero ahora no tengo ganas XD)
void optimizar_memoria(map <string,int> &etiquetas,map <string,int> &variables){
   for (map<string,int>::iterator it=etiquetas.begin(); it!=etiquetas.end();it++){
        map<string,int>::iterator encontrado_variable=variables.find(it->first);
        if(encontrado_variable!=variables.end()){
            variables.erase(encontrado_variable);
        }
   }
}

string trim_espacios(string a){
    while(a.find_first_of(" \t")==0){
        a=a.substr(1);
    }
    return a;
}
//quita los comentarios y va reconociendo las etiquetas, variables y constantes para poder direccionarlas despues
vector<string> limpiar_codigo(ifstream &input_file,map <string,int> &etiquetas,map <string,int> &variables,map <string,int> &constantes){
	vector<string> program;
	string line;
    string comando_limpio;
	int linea_leida=0;
	int variable_leida=0;
	int constante_leida=0;

	while(getline(input_file, line)){
		string new_codeline;
		line = line.substr(0,line.find(';')); //eliminando comentarios
		size_t label_pos = line.find(':'); //busca etiquetas
		if (label_pos != string::npos){
		   string label=line.substr(0,label_pos);
            if(etiquetas.find(label)== etiquetas.end()){
                etiquetas.insert ( pair<string,int>(label,linea_leida) ); //guarda la etiqueta con su posicion
            }
            else{
                cout<<"Error al compilar: label duplicado, linea "<<linea_leida<<endl;
                exit(-1);
            }
            line=line.substr(label_pos+1); //linea sin comentario y sin etiqueta
		}
        line=trim_espacios(line);	
        string comando=line.substr(0,line.find(' '));//busca instruccion
        line=line.substr(line.find(' ')+1);//lineas con operandos
        line=trim_espacios(line);
        comando_limpio=comando+" "+line;
        if(instructions_codes.find(comando)!= instructions_codes.end()){
            if(comando!=string("BEQ")){
                string primer_op=line.substr(0,line.find(',')); //busca primer operando
                string segundo_op=line.substr(line.find(',')+1); //busca segundo operando
                if((comando!=string("IN"))&&(comando!=string("OUT"))){
                    if(es_variable(primer_op)){
                        if(variables.find(primer_op)== variables.end()){
                            variables.insert ( pair<string,int>(primer_op,variable_leida) );
                            variable_leida++;
                        }
                    }
                    if(es_constante(primer_op)){
                        if(constantes.find(primer_op)== constantes.end()){
                            constantes.insert ( pair<string,int>(primer_op,constante_leida) );
                            constante_leida++;
                        }
                    }
                }
                else{
                    if(atoi (primer_op.c_str())>32){
                        cout<<"Error al compilar: IN/OUT designa un puerto invalido, linea "<<linea_leida<<endl;
                        exit(-1);
                    }
                }   
                if(es_variable(segundo_op)){
                    if(variables.find(segundo_op)== variables.end()){
                        variables.insert ( pair<string,int>(segundo_op,variable_leida) );
                        variable_leida++;
                    }
                }
                if(es_constante(segundo_op)){
                    if(comando=="MOV"){
                        cout<<"Error al compilar, no se puede hacer MOV con destino constante"<<endl;
                        exit(-1);
                    }
                    if(constantes.find(segundo_op)== constantes.end()){
                        constantes.insert ( pair<string,int>(segundo_op,constante_leida) );
                        constante_leida++;
                    }
                }
            }
        }
            else{
                cout<<"Error al compilar: instruccion invalida en linea "<<linea_leida<<endl;
                exit(-3);
            }

       
        program.push_back(comando_limpio);
        linea_leida++;
	}
	return program;
}

/************************** MAIN ************************************/
int main(int argc,char * argv[]){

    vector<string> codigo_limpio;
    map <string,int> etiquetas;
    map <string,int> variables;
    map <string,int> constantes;
    cout<<"Bienvenido al compilador de prueba"<<endl;
	if((argc < 2)||((argc==3)&&(argv[1]=="-o"||argv[2]=="-o"))) {
		cout << "El programa debe recibir al menos 1 parametro (archivo a ensamblar)" << std::endl;
		cout << "El formato correcto de ejecucion es: " << argv[0] << " archivo_assembler [archivo_salida --opcional]" << std::endl;
        return -1;
	}
    string archivo_in=string(argv[1]);
    string archivo_out;
    if(argc<3){
    	archivo_out=archivo_in.substr(0,archivo_in.find_last_of('.'))+".hex";   
	}
    else{
        archivo_out=string(argv[2]);
    }
    cout<<"abriendo archivo de entrada: "<< archivo_in<<endl;
    ifstream input_file_fstream(archivo_in.c_str());
        
    if(input_file_fstream.fail()){
		cerr << "No se pudo abrir archivo de entrada" << std::endl;
		return -2;
	}
    //defino los valores del codigo aca, es horrible pero evita que el compilador se queje
    instructions_codes.insert ( pair<string,string>("ADD","00") );
    instructions_codes.insert ( pair<string,string>("CMP","01") );
    instructions_codes.insert ( pair<string,string>("MOV","10") );
    instructions_codes.insert ( pair<string,string>("BEQ","1100") );
    instructions_codes.insert ( pair<string,string>("IN","1110") );
    instructions_codes.insert ( pair<string,string>("OUT","1111") );
    cout<<"leyendo archivo de entrada"<<endl;
    codigo_limpio=limpiar_codigo(input_file_fstream,etiquetas,variables,constantes);
    input_file_fstream.close();
    cout<<"optimizando uso de memoria"<<endl;
    optimizar_memoria(etiquetas,variables);
    cout<<"parseando codigo en lenguaje maquina"<<endl;
    vector<string> codigo_ensamblado=parser_codigo(codigo_limpio,etiquetas,variables,constantes);
    cout<<"generando archivo de salida: "<<endl;  
    return escribir_output(archivo_out,codigo_ensamblado);
}

