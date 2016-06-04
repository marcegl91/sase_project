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
#define MAX_SIZE_CODE 128

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
string caps_UP(string a){
    string b=a;
    for(unsigned int i=0;i<a.length();i++){
        b[i]=toupper(a[i]);
    }
    return b;
}

//elimina espacios hasta el primer caracter valido
string trim_espacios(string a){
    while(a.find_first_of(" \t")==0){
        a=a.substr(1);
    }
    return a;
}

//ahora como tengo definido donde voy a ubicar las variables, hago la pasada final
vector<string> parser_codigo(vector<string> codigo_limpio,map <string,int> etiquetas,map <string,int> variables,map <string,int> constantes){
	vector<string> program;
	int posicion_variables=codigo_limpio.size();
	int posicion_constantes=posicion_variables+variables.size();
	if(posicion_constantes+constantes.size()>MAX_SIZE_CODE){
        	cout<<"El codigo excede el limite de memoria de la maquina "<<endl;
	 	exit(-1);
    	}
    	program.resize(posicion_constantes+constantes.size());
	for(unsigned int i=0;i<codigo_limpio.size();i++){
        string comando=codigo_limpio[i].substr(0,codigo_limpio[i].find(' '));//busca instruccion
        string instruccion_asm=instructions_codes.find(comando)->second; //pone los ultimos digitos con el codigo
        string line=codigo_limpio[i].substr(codigo_limpio[i].find(' ')+1);//lineas con operandos
        line=trim_espacios(line);
        string primer_op;
        string segundo_op;
        bool usa_segundo_comando=true;
        segundo_op=trim_espacios(segundo_op);
        if((comando=="IN")||(comando=="OUT")){ 
            //instruccion con primer operando de 5 bits
            primer_op=line.substr(0,line.find(',')); //busca primer operando
            segundo_op=line.substr(line.find(',')+1); //busca segundo operando
            primer_op=int_a_binario(atoi(primer_op.c_str()),5); //pone los digitos del medio con el puerto designado
        }
        if(comando=="BEQ"||comando=="CALL"){
            //instruccion sin primer operando
            primer_op=""; 
            segundo_op=line;
            if(etiquetas.find(segundo_op)==etiquetas.end()||!es_direccion(segundo_op)){
                cout<<"error: BEQ/CALL apunta a una etiqueta invalida: \""<<segundo_op <<"\", linea:"<< i<<endl;
                exit(-1);
            }
        }
        if(comando=="DW"){
            //instruccion asignacion
            primer_op=int_a_binario(atoi(line.c_str()),16); 
            segundo_op="";
            usa_segundo_comando=false;
        }
        if(comando=="RET"){
        	primer_op="";
        	segundo_op=int_a_binario(0,7);
        	usa_segundo_comando=false;
        }
        if(comando=="MOV"||comando=="ADD"||comando=="CMP"){
            //instruccion con primer operando de 7 bits
            primer_op=line.substr(0,line.find(',')); //busca primer operando
            segundo_op=line.substr(line.find(',')+1); //busca segundo operando 
            map<string,int>::iterator it=etiquetas.find(primer_op);
            if(it!= etiquetas.end()){  
                primer_op=int_a_binario(it->second,7);
            }
            else{
                if(es_variable(primer_op)){
                    primer_op=int_a_binario((posicion_variables+variables.find(primer_op)->second),7);
                }
                else{
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
        }
        //segundo operando de la instruccion
        //si es una etiqueta
        if(usa_segundo_comando){
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
        }
        //pone  los primeros digitos con D y arma toda la instruccion
        program[i]=instruccion_asm+primer_op+segundo_op;
	}
    //relleno las "variables" en cero para que no chille nadie del simulador
    for(unsigned int j=0;j<variables.size();j++){
        program[posicion_variables+j]=int_a_binario(0,16);
    }
	return program;
}

//Formato Instruccion MOV a,b ADD a,b C
//quita los comentarios y va reconociendo las etiquetas, variables y constantes para poder direccionarlas despues
vector<string> limpiar_codigo(ifstream &input_file,map <string,int> &etiquetas,map <string,int> &variables,map <string,int> &constantes){
	vector<string> program;
	string line;
    string comando_limpio;
	int linea_leida=0;
    int linea_codigo=0;
	int variable_leida=0;
	int constante_leida=0;

	while(getline(input_file, line)){
        line=trim_espacios(line);               //elimino los espacios hasta el primer caracter valido
        if((line.length()!=0)&&(line[0]!=';')){ //si la linea que queda no es nula o no es un comentario la analizo
    		line = line.substr(0,line.find(';')); //elimino los comentarios
    		size_t label_pos = line.find(':'); //busca etiquetas
    		if (label_pos != string::npos){
    		   string label=line.substr(0,label_pos);
                if(etiquetas.find(label)== etiquetas.end()){
                    etiquetas.insert ( pair<string,int>(label,linea_leida) ); //guarda la etiqueta con su posicion
                }
                else{
                    cout<<"Error al compilar: label duplicado:\""<<label<<"\" linea "<<linea_leida<<endl;
                    exit(-1);
                }
                line=line.substr(label_pos+1); //linea sin comentario y sin etiqueta
    		}
            line=trim_espacios(line);	
            string comando=line.substr(0,line.find(' '));//busca instruccion
            string primer_op;
            string segundo_op;
            if(comando.length()!=0){
                line=line.substr(line.find(' ')+1);//lineas con operandos
                line=trim_espacios(line);
                comando=caps_UP(comando);       //lo convierto a mayusculas para no tener problemas
                if(instructions_codes.find(comando)!= instructions_codes.end()){
                    if((comando==string("BEQ"))||(comando==string("CALL"))||(comando==string("DW"))||(comando==string("RET"))){
                        comando_limpio=comando+" "+line;
                    }
                    else{
                        primer_op=line.substr(0,line.find(',')); //busca primer operando
                        segundo_op=line.substr(line.find(',')+1); //busca segundo operando
                        segundo_op=trim_espacios(segundo_op);
                        if((comando==string("MOV"))||(comando==string("ADD"))||(comando==string("CMP"))) {
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
                        if((comando==string("IN"))||(comando==string("OUT"))){
                            if(atoi (primer_op.c_str())>32){
                                cout<<"Error al compilar: IN/OUT designa un puerto invalido, linea "<<linea_leida<<endl;
                                exit(-1);
                            }
                        }
                        if(es_variable(segundo_op)&&(variables.find(segundo_op)== variables.end())) {
                                variables.insert ( pair<string,int>(segundo_op,variable_leida) );
                                variable_leida++;
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
                        comando_limpio=comando+" "+primer_op+","+segundo_op;
                    }
                    
                }
                else{
                        cout<<"Error al compilar: instruccion invalida en linea "<<linea_codigo+1<<endl;
                        cout<<"instruccion: "<<comando+" "+line<<endl;
                        exit(-3);
                }  
                program.push_back(comando_limpio);
                linea_leida++;
            }
        
        }
        linea_codigo++;
	}
	return program;
}

void optimizar_memoria(map <string,int> &etiquetas,map <string,int> &variables){
   for (map<string,int>::iterator it=etiquetas.begin(); it!=etiquetas.end();it++){
        map<string,int>::iterator encontrado_variable=variables.find(it->first);
        if(encontrado_variable!=variables.end()){
            variables.erase(encontrado_variable);
        }
   }
   int i=0;
   for (map<string,int>::iterator it=variables.begin(); it!=variables.end();it++){
        it->second=i;
        i++;
   }
   
}

/************************** MAIN ************************************/
int main(int argc,char * argv[]){

    vector<string> codigo_limpio;
    map <string,int> etiquetas;
    map <string,int> variables;
    map <string,int> constantes;
    cout<<"Bienvenido al compilador de prueba"<<endl;
	if((argc < 2)) {
		cout << "El programa debe recibir al menos 1 parametro (archivo a ensamblar)" << std::endl;
		cout << "El formato correcto de ejecucion es: " << argv[0] << " archivo_assembler [archivo_salida --opcional]" << std::endl;
        return -1;
	}
    /*tratando de fabricar el soporte para windows
    //string archivo_in;
    //getline(cin,archivo_in);
    */
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
    //defino los valores del codigo aca
    //instrucciones con dos parametros 7 bits
    instructions_codes.insert ( pair<string,string>("ADD","00") );
    instructions_codes.insert ( pair<string,string>("CMP","01") );
    instructions_codes.insert ( pair<string,string>("MOV","10") );
    //instruccion con 1 parametro de 5 bits y uno de 7
    instructions_codes.insert ( pair<string,string>("IN",  "1110") );
    instructions_codes.insert ( pair<string,string>("OUT", "1111") );
    //instruccion con 1 parametro de 7
    instructions_codes.insert ( pair<string,string>("BEQ", "110000000") );
    instructions_codes.insert ( pair<string,string>("CALL","110010000") );
    instructions_codes.insert ( pair<string,string>("RET", "110011000") );
    //instruccion de ensamble de 16 bits
    instructions_codes.insert ( pair<string,string>("DW","") );
    //
    cout<<"leyendo archivo de entrada"<<endl;
    codigo_limpio=limpiar_codigo(input_file_fstream,etiquetas,variables,constantes);
    input_file_fstream.close();
    cout<<"optimizando memorias"<<endl;
    optimizar_memoria(etiquetas,variables);
    cout<<"parseando codigo en lenguaje maquina"<<endl;
    vector<string> codigo_ensamblado=parser_codigo(codigo_limpio,etiquetas,variables,constantes);
    //  vector<string> codigo_ensamblado=codigo_limpio;
    cout<<"generando archivo de salida: "<<endl;  
    ofstream output_file_fstream(archivo_out.c_str());
    if(output_file_fstream.fail()){
        cerr << "No se pudo crear archivo de salida" << std::endl;
        return -2;
    }
    for (unsigned int i=0;i<codigo_ensamblado.size();i++)
        output_file_fstream<<codigo_ensamblado[i]<<endl;

    output_file_fstream.close();
    cout<<"archivo generado "<<archivo_out<<",tamanio del programa: "<<codigo_ensamblado.size()<<endl;
    return 0;
}


