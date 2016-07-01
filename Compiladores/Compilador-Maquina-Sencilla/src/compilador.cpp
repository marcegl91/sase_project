#include <compilador.hpp>
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
#define WARNING_CALL_STACK 10

using namespace std;

map<string,string> instructions_codes;
map<string,string> etiquetas_ES;
//SOPORTE EXPERIMENTAL PARA WINDOWS, para usarlo descomentar la siguiente linea
//#define Windows_MODE
//funciones auxiliares para conversion de datos(debe haber mejores pero estas andan :) )
bool es_variable(string a){
    return isalpha(a[0]);
}

bool es_direccion(string a){
    return isdigit(a[0]);
}

bool es_constante(string a){
    return a[0]=='@';
}

bool es_x_referencia(string a){
    return a[0]=='[';
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
bool hay_simbolos_reservados_check(string a){
    return a.find_first_of("[],")!=string::npos;
}

bool direccion_check(string a){
    bool res=true;
    for(unsigned int i=0;i<a.length();i++){
        if(!isdigit(a[i]))
            res=false;
    }
    return res&&(a.length()>0);
}
bool limpiar_espacios(string &a){
    string basura="";
    a=trim_espacios(a);
    if(a.find_first_of(" \t")!=string::npos){
        basura=a.substr(a.find_first_of(" \t"));
        a=a.substr(0,a.find_first_of(" \t"));
        basura=trim_espacios(basura);
    }
    if(basura.length()>0){
        return false;
    }
    return true;
}

bool operando_check(string &a){
    a=trim_espacios(a);
    string auxiliar=a;
    string basura="";
    bool hay_llaves=false;
    if((a.find_first_of("[")!=string::npos) &&
        ((a.find_first_of("[")!=0)||(a.find_first_of("]")==string::npos)) ) {
        //cout<<"error con las llaves"<<endl;
        return false;
    }
    if(a.find_first_of("[")==0) {
        hay_llaves=true;
        if(a.find_first_of("]")!=string::npos){
            auxiliar=a.substr(1,a.find_first_of("]")-1);
            basura=a.substr(a.find_first_of("]")+1);
        }
        else{
         //   cout<<"falta cerrar llave"<<endl;
            return false;
        }
        basura=trim_espacios(basura);
        if(basura.length()>0||(auxiliar.find_first_of("[")!=string::npos)){
        //    cout<<"error en las llaves"<<endl;
            return false;
        }
    }
    auxiliar=trim_espacios(auxiliar);
    if(es_constante(auxiliar)){
        auxiliar="@"+trim_espacios(auxiliar.substr(1));
    }
    if(!limpiar_espacios(auxiliar)){
        return false;
    }
    if(hay_llaves){
        a="["+auxiliar+"]";
    }
    else
        a=auxiliar;
    if(hay_simbolos_reservados_check(auxiliar)){
        return false;
    }
    if(es_constante(auxiliar)){
        auxiliar=auxiliar.substr(1);
        auxiliar=trim_espacios(auxiliar);
        return direccion_check(auxiliar);
    }
    else{
        if(!es_variable(auxiliar)){
            return direccion_check(auxiliar);
        }
    }
    return true;
}


string address_solver(string var,map <string,int> etiquetas,map <string,int> variables,map <string,int> &lea_address){
    int address;
    map<string,int>::iterator it_label=etiquetas.find(var);
    if(it_label!= etiquetas.end()){
        address=it_label->second;
    }
    else{
        if(es_direccion(var)){
            address=string_a_int(var);
        }
        else{
            address=variables.find(var)->second;
        }
    }
    return int_a_binario(address,7);
}
//retorna cero si no existe
int ver_si_existe_constante(int var,map <string,int> &variables){
    int resultado=-1;
    string aux="@"+int_a_string(var);
    map<string,int>::iterator encontrado=variables.find(aux);
    if(encontrado!=variables.end()){
        resultado=encontrado->second;
    }
    return resultado;
}

void optimizar_memoria(int pos_inicial, map <string,int> &etiquetas,map <string,int> &variables,map <string,int> &lea_address){
   for (map<string,int>::iterator it=etiquetas.begin(); it!=etiquetas.end();it++){
        map<string,int>::iterator encontrado_variable=variables.find(it->first);
        if(encontrado_variable!=variables.end()){
            variables.erase(encontrado_variable);
        }
   }
   int i=0;
   int posicion_variables=pos_inicial;
   int posicion_lea_address=posicion_variables+variables.size();
   for (map<string,int>::iterator it=variables.begin(); it!=variables.end();it++){
        it->second=posicion_variables+i;
        i++;
   }
    int tamanio_reducido=0;
    int tamanio_utilizado=0;
   for (map<string,int>::iterator it_lea=lea_address.begin(); it_lea!=lea_address.end();it_lea++){
        map<string,int>::iterator it_etiqueta=etiquetas.find(it_lea->first); //miro si es una etiqueta lo que busco la direccion
        int posicion=-1;
        if(it_etiqueta!= etiquetas.end()){
            posicion=ver_si_existe_constante(it_etiqueta->second,variables);  //miro si la direccion de la etiqueta ya existe como constante
        }
        else{
            if(es_variable(it_lea->first)){                                    //si es una variable
                map<string,int>::iterator it_variable=variables.find(it_lea->first);//busco su posicion
                if(it_variable!=variables.end()){
                    posicion=ver_si_existe_constante(it_variable->second,variables);//si hay una constante con esa posicion
                }
            }
            else
                if(es_constante(it_lea->first)){
                    string aux=it_lea->first.substr(1);
                    posicion=ver_si_existe_constante(string_a_int(aux),variables);//si hay una constante con esa posicion
                }
                else
                    if(es_direccion(it_lea->first)){
                        posicion=ver_si_existe_constante(string_a_int(it_lea->first),variables);
                    }
        }
        if(posicion>=0){
            it_lea->second=posicion;
            tamanio_reducido++;
        }
        else{
            it_lea->second=posicion_lea_address+tamanio_utilizado;
            tamanio_utilizado++;
        }
   }
   cout<<"Tamanio reducido: "<<tamanio_reducido<<endl;
}

//ahora como tengo definido donde voy a ubicar las variables, hago la pasada final
vector<string> generador_codigo(vector<string> codigo_limpio,map <string,int> etiquetas,map <string,int> variables,map <string,int> &lea_address){
    vector<string> program;
    int posicion_variables=codigo_limpio.size();
    int posicion_lea_address=posicion_variables+variables.size();
    int cantidad_call_hallados=0;
    program.resize(posicion_lea_address);
    for(unsigned int i=0;i<codigo_limpio.size();i++){
        string comando=codigo_limpio[i].substr(0,codigo_limpio[i].find(' '));//busca instruccion
        string instruccion_asm=instructions_codes.find(comando)->second; //pone los ultimos digitos con el codigo
        string line=codigo_limpio[i].substr(codigo_limpio[i].find(' ')+1);//lineas con operandos
        line=trim_espacios(line);
        string primer_op;
        string segundo_op;
        //bool usa_segundo_comando=true;
        segundo_op=trim_espacios(segundo_op);
        if((comando=="IN")||(comando=="OUT")){
            //instruccion con primer operando de 5 bits
            primer_op=line.substr(0,line.find(',')); //busca primer operando
            segundo_op=line.substr(line.find(',')+1); //busca segundo operando
            primer_op=int_a_binario(atoi(primer_op.c_str()),5); //pone los digitos del medio con el puerto designado
            segundo_op=address_solver(segundo_op,etiquetas,variables,lea_address);
        }
        if(comando=="BEQ"||comando=="CALL"){
            //instruccion sin primer operando
            if(comando=="CALL")
                cantidad_call_hallados++;
            primer_op="";
            segundo_op=address_solver(line,etiquetas,variables,lea_address);
            if(etiquetas.find(line)==etiquetas.end()&&!es_direccion(line)){
                cout<<"error: "<<comando<<" apunta a una etiqueta invalida: \""<<line <<"\", linea:"<< i<<endl;
                exit(-1);
            }
        }
        if(comando=="DW"){
            //instruccion asignacion
            primer_op=int_a_binario(atoi(line.c_str()),16);
            segundo_op="";
        }
        if(comando=="RET"){
            primer_op="";
            segundo_op=int_a_binario(0,7);
        }
        if(comando=="LEA"){
            primer_op=line.substr(0,line.find(',')); //busca primer operando
            segundo_op=line.substr(line.find(',')+1); //busca segundo operando
            map<string,int>::iterator it_address=lea_address.find(primer_op);
            if(it_address!=lea_address.end()){
                primer_op=int_a_binario(it_address->second,7);
            }
            else{
                cout<<"error, LEA no puede encontrar la direccion de: "<<primer_op<<" linea "<<i<<endl;
                exit(-1);
            }
            segundo_op=address_solver(segundo_op,etiquetas,variables,lea_address);
        }
        if(comando=="MOV"||comando=="ADD"||comando=="CMP"){
            //instruccion con primer operando de 7 bits
            primer_op=line.substr(0,line.find(',')); //busca primer operando
            segundo_op=line.substr(line.find(',')+1); //busca segundo operando
            primer_op=address_solver(primer_op,etiquetas,variables,lea_address);
            segundo_op=address_solver(segundo_op,etiquetas,variables,lea_address);
        }
        //pone  los primeros digitos con D y arma toda la instruccion
        program[i]=instruccion_asm+primer_op+segundo_op;
    }
    //relleno las "variables" con cero y las constantes con su valor
    for (map<string,int>::iterator it_const=variables.begin(); it_const!=variables.end();it_const++){
        if(es_variable(it_const->first)){
            program[it_const->second]=int_a_binario(0,16);
        }
        else{
            string a=it_const->first;
            a=a.substr(1);
            program[it_const->second]=int_a_binario(string_a_int(a),16);
        }
    }
    //relleno las "direcciones de lea con su valor"
    for (map<string,int>::iterator it_address=lea_address.begin(); it_address!=lea_address.end();it_address++){
        map<string,int>::iterator it_etiqueta=etiquetas.find(it_address->first);
        if(it_address->second>=posicion_lea_address){
            if(it_etiqueta!= etiquetas.end()){
                program.push_back(int_a_binario(it_etiqueta->second,16));
            }
            else{
                if(es_variable(it_address->first)||es_constante(it_address->first)){
                    map<string,int>::iterator it_variable=variables.find(it_address->first);
                    if(it_variable!=variables.end()){
                        program.push_back(int_a_binario(it_variable->second,16));
                    }
                    else{
                        cout<<"LEA invalido, referencia a variable inexistente: "<<it_address->first<<endl;
                        exit(-1);
                    }
                }
                else
                    program.push_back(int_a_binario(string_a_int(it_address->first),16));
            }
        }
    }
    if(program.size()>MAX_SIZE_CODE){
        cout<<"El codigo excede el limite de memoria de la maquina "<<endl;
        exit(-1);
    }
    if(WARNING_CALL_STACK<cantidad_call_hallados){
        cout<<"Advertencia: El codigo utiliza excesiva cantidad de CALL"<<endl;
        cout<<"La memoria de la maquina podria no ser suficiente "<<endl;
    }
    return program;
}

bool agregar_var(string var, map <string,int> &variables){
    if(!operando_check(var)){
        return false;
    }
    if(((es_constante(var))||(es_variable(var))) &&(variables.find(var)== variables.end())) {
        variables.insert ( pair<string,int>(var,variables.size()) );
    }
    return true;
}

void agregar_lea(string var,map <string,int> &lea_address){
    if(lea_address.find(var)== lea_address.end()){
        lea_address.insert ( pair<string,int>(var,lea_address.size()) ); //guarda la etiqueta con su posicion
    }
}

void chequear_error_operando(string &operando,int linea_codigo,string comando,string line){
    if(!operando_check(operando)){
        cout<<"parametro invalido, linea: "<<linea_codigo<<endl;
        cout<<comando<<" "<<line<<endl;
        exit(-1);
    }
}
void eliminar_comentarios(string &linea){
    linea= trim_espacios(linea);
    linea = linea.substr(0,linea.find(';')); //elimino los comentarios
}

void chequear_destino_valido(string operando,int linea_codigo,string comando,string line){
    if(es_constante(operando)){
        cout<<"Error al compilar, no se puede hacer "<<comando<<" con destino constante, linea: "<<linea_codigo+1<<endl;
        cout<<comando<<" "<<line<<endl;
        exit(-1);
    }
}

void buscar_etiquetas(string &line,int linea_leida,map <string,int> &etiquetas,int linea_codigo){
    size_t label_pos = line.find(':');
    if (label_pos != string::npos){
        string label=line.substr(0,label_pos);
        line=line.substr(label_pos+1); //linea sin comentario y sin etiqueta
        if(!limpiar_espacios(label)||hay_simbolos_reservados_check(label)){
            cout<<"Error al compilar: label invalido:\""<<label<<"\" linea "<<linea_codigo+1<<endl;
            exit(-1);
        }
        if(etiquetas.find(label)== etiquetas.end()){
            etiquetas.insert ( pair<string,int>(label,linea_leida) ); //guarda la etiqueta con su posicion
        }
        else{
            cout<<"Error al compilar: label duplicado:\""<<label<<"\" linea "<<linea_codigo+1<<endl;
            exit(-1);
        }

    }
}

//quita los comentarios y va reconociendo las etiquetas, variables y constantes para poder direccionarlas despues
vector<string> parser(ifstream &input_file,map <string,int> &etiquetas,map <string,int> &variables,map <string,int> &lea_address){
    vector<string> program;
    string line;
    string comando_limpio;
    int linea_leida=0;
    int linea_codigo=0;

    while(getline(input_file, line)){
        eliminar_comentarios(line);                       //elimino los espacios hasta el primer caracter valido
        if(line.length()!=0){                             //si la linea que queda no es nula
            buscar_etiquetas(line,linea_leida,etiquetas,linea_codigo); //
            line= trim_espacios(line);
            string comando=line.substr(0,line.find(' '));//busca instruccion
            string primer_op;
            string segundo_op;
            if(comando.length()!=0){
                line=line.substr(line.find(' ')+1);//lineas con operandos
                line=trim_espacios(line);
                comando=caps_UP(comando);       //lo convierto a mayusculas para no tener problemas
                if(instructions_codes.find(comando)!= instructions_codes.end()){
                    if((comando==string("BEQ"))||(comando==string("CALL"))||(comando==string("DW"))||
                        (comando==string("JMP"))||(comando==string("RET"))){
                        if(comando==string("JMP")){
                            program.push_back("CMP 0,0");
                            linea_leida++;
                            comando=string("BEQ");
                        }
                        if(!operando_check(line)){
                            cout<<"parametro invalido, linea: "<<linea_codigo<<endl;
                            cout<<comando<<" "<<line<<endl;
                            exit(-1);
                        }
                        program.push_back(comando+" "+line);
                        linea_leida++;
                    }
                    else{
                        primer_op=line.substr(0,line.find(',')); //busca primer operando
                        segundo_op=line.substr(line.find(',')+1); //busca segundo operando
                        if(comando==string("INC")){
                            chequear_error_operando(primer_op,linea_codigo,comando,line);
                            agregar_var("@1",variables);
                            agregar_var(primer_op,variables);
                            program.push_back("ADD @1,"+primer_op);
                            linea_leida++;
                        }
                        if(comando==string("DEC")){
                            chequear_error_operando(primer_op,linea_codigo,comando,line);
                            agregar_var(primer_op,variables);
                            agregar_var("@65535",variables);
                            program.push_back("ADD @65535,"+primer_op);
                            linea_leida++;
                        }
                        if(comando==string("SUB")){
                            chequear_error_operando(primer_op,linea_codigo,comando,line);
                            chequear_error_operando(segundo_op,linea_codigo,comando,line);
                            chequear_destino_valido(primer_op,linea_codigo,comando,line);
                            agregar_var(primer_op,variables);
                            agregar_var("@65535",variables);
                            agregar_var("@0",variables);
                            string variable_auxiliar="VARIABLE_AUXILIAR_ASM_###_Asquerosa_Imposible_de_Repetir";
                            agregar_var(variable_auxiliar,variables);
                            agregar_var(segundo_op,variables);
                            int label_fin=linea_leida+7;
                            int label_iteracion=linea_leida+1;
                            program.push_back("MOV "+segundo_op+","+variable_auxiliar); //      MOV B,Var_resta
                            program.push_back("CMP @0,"+variable_auxiliar);             //loop: CMP @0,Var_resta
                            program.push_back("BEQ "+ int_a_string(label_fin));         //      BEQ fin
                            program.push_back("ADD @65535,"+variable_auxiliar);         //      DEC Var_Resta
                            program.push_back("ADD @65535,"+primer_op);                 //      DEC A
                            program.push_back("CMP 0,0");                               //      CMP 0,0
                            program.push_back("BEQ "+int_a_string(label_iteracion));    //      BEQ loop
                            linea_leida+=7;
                        }
                        if(comando==string("LEA")){
                            chequear_error_operando(primer_op,linea_codigo,comando,line);
                            chequear_error_operando(segundo_op,linea_codigo,comando,line);
                            chequear_destino_valido(segundo_op,linea_codigo,comando,line);
                            agregar_lea(primer_op,lea_address);
                            if(es_direccion(primer_op)){
                                cout<<"ADVERTENCIA, LEA CARGA LITERAL EN POSICION DE MEMORIA"<<endl;
                                cout<<"LEA "<<primer_op<<","<<segundo_op<<" linea:"<<linea_codigo<<endl;
                            }
                            agregar_var(segundo_op,variables);
                            program.push_back(comando+" "+primer_op+","+segundo_op);
                            linea_leida++;
                        }

                        if(comando==string("ADD")){
                            chequear_error_operando(primer_op,linea_codigo,comando,line);
                            chequear_error_operando(segundo_op,linea_codigo,comando,line);
                            chequear_destino_valido(segundo_op,linea_codigo,comando,line);
                            agregar_var(primer_op,variables);
                            agregar_var(segundo_op,variables);
                            program.push_back(comando+" "+primer_op+","+segundo_op);
                            linea_leida++;
                        }
                        if(comando==string("MOV")){
                            chequear_error_operando(primer_op,linea_codigo,comando,line);
                            chequear_error_operando(segundo_op,linea_codigo,comando,line);
                            chequear_destino_valido(segundo_op,linea_codigo,comando,line);
                            if(es_x_referencia(primer_op)){
                                agregar_var("@1",variables);
                                agregar_var("@0",variables);
                                agregar_var("@7",variables);
                                agregar_var("@32768",variables);
                                string contador_shift="VARIABLE_AUXILIAR_ASM_###_Asquerosa_Imposible_de_Repetir";
                                agregar_var(contador_shift,variables);
                                primer_op=primer_op.substr(1,primer_op.find(']')-1);
                                int pos_loop=linea_leida+2;
                                int pos_fin_loop=pos_loop+6;
                                int pos_var_x=pos_fin_loop+2;
                                if(!es_x_referencia(segundo_op)){
                                    pos_var_x++;
                                }
                                program.push_back("MOV "+primer_op+","+int_a_string(pos_var_x));               //      MOV a,X
                                program.push_back("MOV @0,"+contador_shift);                                   //      MOV @0,Contador Loop
                                program.push_back("CMP @7,"+contador_shift);                                   //loop: CMP CONTADOR_LOOP,7
                                program.push_back("BEQ "+int_a_string(pos_fin_loop));                          //      BEQ FIN
                                program.push_back("ADD "+int_a_string(pos_var_x)+","+int_a_string(pos_var_x)); //      ADD X,X
                                program.push_back("ADD @1,"+contador_shift);                                   //      INC contador_loop
                                program.push_back("CMP 0,0");                                                  //      CMP 0,0
                                program.push_back("BEQ "+int_a_string(pos_loop));                              //      BEQ loop
                                program.push_back("ADD @32768,"+int_a_string(pos_var_x));                      //FIN   ADD 10..0,x
                                if(es_x_referencia(segundo_op)){//Mov [A],[B]
                                    segundo_op=segundo_op.substr(1,segundo_op.find(']')-1) ;
                                    program.push_back("ADD "+segundo_op+","+int_a_string(pos_var_x));          //      ADD B,X
                                    linea_leida+=11;
                                }
                                else{ //Mov [A],B
                                    agregar_lea(segundo_op,lea_address);
                                    program.push_back("LEA "+segundo_op+","+contador_shift);                   //      LEA B,var
                                    program.push_back("ADD "+contador_shift+","+int_a_string(pos_var_x));      //      ADD var,X
                                    linea_leida+=12;
                                }
                                program.push_back("MOV "+primer_op+",0");                                      //x:    MOV A,0
                            }
                            else{
                                if(es_x_referencia(segundo_op)){ //MOV A,[B]
                                    segundo_op=segundo_op.substr(1,segundo_op.find(']')-1) ;
                                    program.push_back("ADD "+segundo_op+","+int_a_string(linea_leida+1));
                                    program.push_back("MOV "+primer_op+",0");
                                    linea_leida+=2;
                                }
                                else{                            //MOV A,[B]
                                    program.push_back(comando+" "+primer_op+","+segundo_op);
                                    linea_leida++;
                                }
                            }
                            agregar_var(primer_op,variables);
                            agregar_var(segundo_op,variables);
                        }
                        //shiftl x,desplazamiento
                        if(comando==string("SHIFTR")||comando==string("SHIFTL")){
                            chequear_error_operando(primer_op,linea_codigo,comando,line);
                            chequear_error_operando(segundo_op,linea_codigo,comando,line);
                            chequear_destino_valido(primer_op,linea_codigo,comando,line);
                            agregar_var(primer_op,variables);
                            string contador_shift="VARIABLE_AUXILIAR_ASM_###_Asquerosa_Imposible_de_Repetir";
                            agregar_var(contador_shift,variables);
                            agregar_var("@0",variables);
                            if(es_constante(segundo_op)){
                                int primer_parametro=0;
                                if(comando==string("SHIFTR"))
                                    primer_parametro=32768;
                                primer_parametro+=string_a_int(segundo_op.substr(1));
                                string aux="@"+int_a_string(primer_parametro);
                                agregar_var(aux,variables);
                                program.push_back("OUT "+etiquetas_ES.find("PUERTO_0_SHIFTER")->second+","+aux);
                            }
                            else{
                                agregar_var(segundo_op,variables);
                                agregar_var("@32768",variables);
                                if(comando==string("SHIFTR"))
                                    program.push_back("MOV @32768,"+contador_shift);
                                else
                                    program.push_back("MOV @0,"+contador_shift);
                                program.push_back("ADD "+segundo_op+","+contador_shift);
                                program.push_back("OUT "+etiquetas_ES.find("PUERTO_0_SHIFTER")->second+","+contador_shift);
                                linea_leida+=2;
                            }
                            program.push_back("OUT "+etiquetas_ES.find("PUERTO_1_SHIFTER")->second+","+primer_op);
                            program.push_back("IN "+etiquetas_ES.find("PUERTO_3_SHIFTER")->second+","+contador_shift);
                            program.push_back("CMP @0,"+contador_shift);
                            program.push_back("BEQ "+int_a_string(linea_leida+2));
                            program.push_back("IN "+etiquetas_ES.find("PUERTO_2_SHIFTER")->second+","+primer_op);
                            linea_leida+=6;
                        }
                        if(comando==string("CMP")) {
                            chequear_error_operando(primer_op,linea_codigo,comando,line);
                            chequear_error_operando(segundo_op,linea_codigo,comando,line);
                            agregar_var(primer_op,variables);
                            agregar_var(segundo_op,variables);
                            program.push_back(comando+" "+primer_op+","+segundo_op);
                            linea_leida++;
                        }
                        if((comando==string("IN"))||(comando==string("OUT"))){
                            chequear_error_operando(primer_op,linea_codigo,comando,line);
                            chequear_error_operando(segundo_op,linea_codigo,comando,line);
                            if(comando==string("IN")){
                                chequear_destino_valido(segundo_op,linea_codigo,comando,line);
                            }
                            if(!es_direccion(primer_op)){
                                map<string,string>::iterator it=etiquetas_ES.find(caps_UP(primer_op));
                                if(it==etiquetas_ES.end()){
                                    cout<<"Error al compilar: "<<comando<<" designa un puerto invalido, linea "<<linea_codigo+1<<endl;
                                    cout<<comando<<" "<<line<<endl;
                                    exit(-1);
                                }
                                primer_op=it->second;
                            }
                            if(atoi (primer_op.c_str())>=32){
                                cout<<"Error al compilar: "<<comando<<" designa un puerto invalido, linea "<<linea_codigo+1<<endl;
                                cout<<comando<<" "<<line<<endl;
                                exit(-1);
                            }
                            agregar_var(segundo_op,variables);
                            program.push_back(comando+" "+primer_op+","+segundo_op);
                            linea_leida++;
                        }
                    }
                }
                else{
                        cout<<"Error al compilar: instruccion invalida en linea "<<linea_codigo+1<<endl;
                        cout<<comando+" "+line<<endl;
                        exit(-3);
                }
            }

        }
        linea_codigo++;
    }
    return program;
}

void inicializar_etiquetas_ES(){
    etiquetas_ES.insert ( pair<string,string>("PUERTO_0_SHIFTER","8") );
    etiquetas_ES.insert ( pair<string,string>("PUERTO_1_SHIFTER","9") );
    etiquetas_ES.insert ( pair<string,string>("PUERTO_2_SHIFTER","10") );
    etiquetas_ES.insert ( pair<string,string>("PUERTO_3_SHIFTER","11") );
    etiquetas_ES.insert ( pair<string,string>("UART_TX","12") );
    etiquetas_ES.insert ( pair<string,string>("UART_RX","13") );
    etiquetas_ES.insert ( pair<string,string>("UART_FULL","14") );
    etiquetas_ES.insert ( pair<string,string>("UART_EMPTY","15") );
    etiquetas_ES.insert ( pair<string,string>("SSEG","16") );
    etiquetas_ES.insert ( pair<string,string>("BTNS","20") );
    etiquetas_ES.insert ( pair<string,string>("SWT","24") );
    etiquetas_ES.insert ( pair<string,string>("LED","28") );
}

void inicializar_instrucciones(){
    //defino los valores del codigo aca
    //instrucciones con dos parametros 7 bits
    instructions_codes.insert ( pair<string,string>("ADD","00") );
    instructions_codes.insert ( pair<string,string>("CMP","01") );
    instructions_codes.insert ( pair<string,string>("MOV","10") );
    instructions_codes.insert ( pair<string,string>("LEA","10") );
    instructions_codes.insert ( pair<string,string>("SUB","10") );
    //instruccion con 1 parametro de 5 bits y uno de 7
    instructions_codes.insert ( pair<string,string>("IN",  "1110") );
    instructions_codes.insert ( pair<string,string>("OUT", "1111") );
    //instruccion con 1 parametro de 7
    instructions_codes.insert ( pair<string,string>("BEQ", "110000000") );
    instructions_codes.insert ( pair<string,string>("CALL","110010000") );
    instructions_codes.insert ( pair<string,string>("RET", "110011000") );
    instructions_codes.insert ( pair<string,string>("JMP", "110000000") );
    instructions_codes.insert ( pair<string,string>("INC", "") );
    instructions_codes.insert ( pair<string,string>("DEC", "") );
    //instruccion con 1 parametro de 4 bits y uno de 7
    instructions_codes.insert ( pair<string,string>("SHIFTL", "") );
    instructions_codes.insert ( pair<string,string>("SHIFTR", "") );
    //instruccion de ensamble de 16 bits
    instructions_codes.insert ( pair<string,string>("DW","") );
    //
}



/************************** MAIN ************************************/
int main(int argc,char * argv[]){

    vector<string> codigo_limpio;
    map <string,int> etiquetas;
    map <string,int> variables;
    map <string,int> lea_address;
    cout<<"Bienvenido al compilador de prueba"<<endl;

#ifdef Windows_MODE
    cout<<"MODO WINDOWS"<<endl;
    cout<<"Ingresar el nombre del archivo asm"<<endl;
    string archivo_in;
    getline(cin,archivo_in);
#else
    cout<<"MODO LINUX"<<endl;
    string archivo_in=string(argv[1]);
    if((argc < 2)) {
        cout << "El programa debe recibir al menos 1 parametro (archivo a ensamblar)" << std::endl;
        cout << "El formato correcto de ejecucion es: ./main archivo_assembler [archivo_salida --opcional]" << std::endl;
        return -1;
    }
#endif
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
    //esto no se tiene que mover de aca
    inicializar_instrucciones();
    inicializar_etiquetas_ES();
    cout<<"leyendo archivo de entrada"<<endl;
    codigo_limpio=parser(input_file_fstream,etiquetas,variables,lea_address);
    input_file_fstream.close();
    cout<<"optimizando memorias"<<endl;
    optimizar_memoria(codigo_limpio.size(),etiquetas,variables,lea_address);
    cout<<"generando codigo en lenguaje maquina"<<endl;
    vector<string> codigo_ensamblado=generador_codigo(codigo_limpio,etiquetas,variables,lea_address);
    cout<<"creando archivo de salida: "<<endl;
    ofstream output_file_fstream(archivo_out.c_str());
    if(output_file_fstream.fail()){
        cerr << "No se pudo crear archivo de salida" << std::endl;
        return -2;
    }
    for (unsigned int i=0;i<codigo_ensamblado.size();i++)
        output_file_fstream<<codigo_ensamblado[i]<<endl;

    output_file_fstream.close();
    cout<<"Archivo generado "<<archivo_out<<",tamanio del programa: "<<codigo_ensamblado.size()<<endl;
    cout<<"Memoria libre restante "<<MAX_SIZE_CODE-codigo_ensamblado.size()<<endl;
    return 0;
}
