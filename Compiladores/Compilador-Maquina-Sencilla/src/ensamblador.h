#ifndef ensamblador_h
#define ensamblador_h
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

class ensamblador {
  public:
    ensamblador();
    vector<string> generador_codigo();
    void optimizar_memoria();
    bool parser(ifstream &input_file);
    bool abrir(string filename);
    bool procesar_asm(string filename);
    bool guardar(string filename);
    
  private:
    void inicializar_etiquetas_ES();
    void inicializar_instrucciones();
    bool es_variable(string a);
    bool es_direccion(string a);
    bool es_constante(string a);
    bool es_x_referencia(string a);
    bool chequear_que_hay_solo_numeros(string a);
    string int_a_binario(int num,int tam_binario);
    string int_a_string(int numero);
    int bin_to_int(string a);
    int hex_to_int(string a);
    int string_a_int(string a);
    string caps_UP(string a);
    string trim_espacios(string a);
    bool hay_simbolos_reservados_check(string a);
    bool numero_binario_check(string &a);
    bool numero_hexa_check(string &a);
    bool string_fragmentado(string &a);
    bool leer_decimal_hexa_o_binario(string &a, bool anadir_corchetes, bool anadir_simbolo_constante);
    string address_solver(string var);
    int ver_si_existe_constante(int var);
    void optimizar_memoria(int pos_inicial);
    bool agregar_var(string var);
    void agregar_lea(string var);
    bool operando_check(string &a,bool soportar_corchete=false);
    void chequear_error_operando(string &operando,int linea_codigo,string comando,string line,bool soportar_corchete=false);
    void eliminar_comentarios(string &linea);
    void chequear_destino_valido(string operando,int linea_codigo,string comando,string line);
    void buscar_etiquetas(string &line,int linea_leida,int linea_codigo);
    int construir_instruccion_por_referencia(vector<string> &program,string &primer_op,string &segundo_op,int &linea_leida);
    int construir_instruccion_por_referencia_sin_shifter(vector<string> &program,string &primer_op,string &segundo_op,int &linea_leida);
    map<string,string> instructions_codes;
    map<string,string> etiquetas_ES;
    vector<string> codigo_limpio;
    vector<string> output;

    map <string,int> etiquetas;
    map <string,int> variables;
    map <string,int> lea_address;
};
ensamblador::ensamblador(){
    inicializar_instrucciones();
    inicializar_etiquetas_ES();
}
//funciones auxiliares para conversion de datos(debe haber mejores pero estas andan :) )
bool ensamblador::es_variable(string a){
    return isalpha(a[0]);
}

bool ensamblador::es_direccion(string a){
    return isdigit(a[0]);
}

bool ensamblador::es_constante(string a){
    return a[0]=='@';
}

bool ensamblador::es_x_referencia(string a){
    return a[0]=='[';
}

bool ensamblador::chequear_que_hay_solo_numeros(string a){
    bool res=true;
    for(unsigned int i=0;i<a.length();i++){
        if(!isdigit(a[i]))
            res=false;
    }
    return res&&(a.length()>0);
}

string ensamblador::int_a_binario(int num,int tam_binario){
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

string ensamblador::int_a_string(int numero){
    string resultado;
    stringstream convert;
    convert << numero;
    resultado = convert.str();
    return resultado;
}

int ensamblador::bin_to_int(string a){
    int numero=0;
    for(unsigned int i=0;i<a.length();i++){
        if(a[i]=='1'){
            numero+=pow(2,a.length()-1-i);
        }
    }
    return numero;

}

int ensamblador::hex_to_int(string a){
    int numero=0;
    for(unsigned int i=0;i<a.length();i++){
        if(('0'<=a[i])&&(a[i]<='9')){
            numero+=(a[i]-'0')*pow(16,a.length()-1-i);
        }
        else{
            if(('A'<=a[i])&&(a[i]<='F')){
                numero+=(10+a[i]-'A')*pow(16,a.length()-1-i);
            }
            else{
                if(('a'<=a[i])&&(a[i]<='f'))
                    numero+=(10+a[i]-'a')*pow(16,a.length()-1-i);
            }
        }
    }
    return numero;
}

int ensamblador::string_a_int(string a){
    return atoi(a.c_str());
}

string ensamblador::caps_UP(string a){
    for(unsigned int i=0;i<a.length();i++){
        a[i]=toupper(a[i]);
    }
    return a;
}

//elimina espacios hasta el primer caracter valido
string ensamblador::trim_espacios(string a){
    while((!a.empty())&&(a.find_first_of(" \t")==0)){
        a=a.substr(1);
    }
    return a;
}
bool ensamblador::hay_simbolos_reservados_check(string a){
    return a.find_first_of("[],@")!=string::npos;
}

bool ensamblador::numero_binario_check(string &a){
    bool res=true;
    for(unsigned int i=0;i<a.length();i++){
        if(a[i]!='0'&&a[i]!='1')
            res=false;
    }
    return res&&(!a.empty());
}   

bool ensamblador::numero_hexa_check(string &a){
    bool res=a.find_first_not_of("1234567890ABCDEFabcdef")==string::npos;
    return res&&(!a.empty());
}

bool ensamblador::string_fragmentado(string &a){
    a=trim_espacios(a);
    if(a.find_first_of(" \t")!=string::npos){
        string basura=a.substr(a.find_first_of(" \t"));
        basura=trim_espacios(basura);
        a=a.substr(0,a.find_first_of(" \t"));
        if(!basura.empty())
            return true;
    }
    return false;
}

bool ensamblador::leer_decimal_hexa_o_binario(string &a, bool anadir_corchetes, bool anadir_simbolo_constante){
    string auxiliar=trim_espacios(a);
    if(string_fragmentado(auxiliar))
        return false;
    if(auxiliar.length()>2){
        if(auxiliar[0]=='0'&&(auxiliar[1]=='b'||auxiliar[1]=='B')){
            auxiliar=auxiliar.substr(2);
            if(numero_binario_check(auxiliar))
                auxiliar=int_a_string(bin_to_int(auxiliar));
            else{
                cout<<"Numero binario invalido ";
                return false;
            }
        }
        else{
            if(auxiliar[0]=='0'&&(auxiliar[1]=='x'||auxiliar[1]=='X')){
                auxiliar=auxiliar.substr(2);
                if(numero_hexa_check(auxiliar))
                    auxiliar=int_a_string(hex_to_int(auxiliar));
                else{
                    cout<<"Numero hexa invalido ";
                    return false;
                }
            }
            else{
                if(!chequear_que_hay_solo_numeros(auxiliar)){
                    cout<<"Numero decimal invalido ";
                    return false;
                }
            }
        }
    }
    else{
        if(!chequear_que_hay_solo_numeros(auxiliar))
            return false;
    }
    if(auxiliar.empty())
        return false;
    if(anadir_simbolo_constante)
        auxiliar="@"+auxiliar;
    if(anadir_corchetes)
        auxiliar="["+auxiliar+"]";
    a=auxiliar;
    return true;
}

bool ensamblador::operando_check(string &a,bool soportar_corchete){
    a=trim_espacios(a);//elimino espacios en blanco
    bool hay_corchetes=false;
    if(a.find_first_of("[")!=string::npos){        //encontre un corchete
        if(!soportar_corchete){
            return false;
        }
        hay_corchetes=true;
        if(a.find_first_of("[")!=0){                    //error: no esta al principio
            cout<<"error: encontrado en medio["<<endl;
            return false;
        }
        string basura="";
        if(a.find_first_of("]")==string::npos){    //error: no esta cerrado
            cout<<"Error: falta ]"<<endl;
            return false;
        }
        else{
            basura=a.substr(a.find_first_of("]")+1);
            basura=trim_espacios(basura);
        }
        if(!basura.empty()){                          //me fijo que despues de ] no haya basura
            cout<<"Error: unexpected "<<basura<<endl;
            return false;
        }
        a=a.substr(1,a.find_first_of("]")-1);           //elimino el corchete inicial y el final
        a=trim_espacios(a);                             //elimino espacios en blanco al principio
    }
    if(es_constante(a)){        //es una constante
        a=a.substr(1);
        return leer_decimal_hexa_o_binario(a,hay_corchetes,true);
    }
    else
        if(es_direccion(a)){    //es una direccion
            return leer_decimal_hexa_o_binario(a,hay_corchetes,false);
        }
        else{               //es una variable
            if(string_fragmentado(a)){   //me fijo que no sea una palabra fragmentada
                return false;
            }
            if(a.empty()||hay_simbolos_reservados_check(a))
                return false;
            if(hay_corchetes){
                a="["+a+"]";
            }
        }
    return true;
}

string ensamblador::address_solver(string var){
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
int ensamblador::ver_si_existe_constante(int var){
    int resultado=-1;
    string aux="@"+int_a_string(var);
    map<string,int>::iterator encontrado=variables.find(aux);
    if(encontrado!=variables.end()){
        resultado=encontrado->second;
    }
    return resultado;
}

void ensamblador::optimizar_memoria(){
   for (map<string,int>::iterator it=etiquetas.begin(); it!=etiquetas.end();it++){
        map<string,int>::iterator encontrado_variable=variables.find(it->first);
        if(encontrado_variable!=variables.end()){
            variables.erase(encontrado_variable);
        }
   }
   int i=0;
   int posicion_variables=codigo_limpio.size();
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
            posicion=ver_si_existe_constante(it_etiqueta->second);  //miro si la direccion de la etiqueta ya existe como constante
        }
        else{
            if(es_variable(it_lea->first)){                                    //si es una variable
                map<string,int>::iterator it_variable=variables.find(it_lea->first);//busco su posicion
                if(it_variable!=variables.end()){
                    posicion=ver_si_existe_constante(it_variable->second);//si hay una constante con esa posicion
                }
            }
            else
                if(es_constante(it_lea->first)){
                    string aux=it_lea->first.substr(1);
                    posicion=ver_si_existe_constante(string_a_int(aux));//si hay una constante con esa posicion
                }
                else
                    if(es_direccion(it_lea->first)){
                        posicion=ver_si_existe_constante(string_a_int(it_lea->first));
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
vector<string> ensamblador::generador_codigo(){
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
        if((comando=="IN")||(comando=="OUT")){
            //instruccion con primer operando de 5 bits
            primer_op=line.substr(0,line.find(',')); //busca primer operando
            segundo_op=line.substr(line.find(',')+1); //busca segundo operando
            primer_op=int_a_binario(atoi(primer_op.c_str()),5); //pone los digitos del medio con el puerto designado
            segundo_op=address_solver(segundo_op);
        }
        if(comando=="BEQ"||comando=="CALL"){
            //instruccion sin primer operando
            if(comando=="CALL")
                cantidad_call_hallados++;
            primer_op="";
            segundo_op=address_solver(line);
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
            segundo_op=address_solver(segundo_op);
        }
        if(comando=="MOV"||comando=="ADD"||comando=="CMP"){
            //instruccion con primer operando de 7 bits
            primer_op=line.substr(0,line.find(',')); //busca primer operando
            segundo_op=line.substr(line.find(',')+1); //busca segundo operando
            primer_op=address_solver(primer_op);
            segundo_op=address_solver(segundo_op);
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
            program[it_const->second]=int_a_binario(string_a_int(a.substr(1)),16);
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
    output=program;
    return program;
}

bool ensamblador::agregar_var(string var){
    if(!operando_check(var)){
        return false;
    }
    if(((es_constante(var))||(es_variable(var))) &&(variables.find(var)== variables.end())) {
        variables.insert ( pair<string,int>(var,variables.size()) );
    }
    return true;
}

void ensamblador::agregar_lea(string var){
    if(lea_address.find(var)== lea_address.end()){
        lea_address.insert ( pair<string,int>(var,lea_address.size()) ); //guarda la etiqueta con su posicion
    }
}

void ensamblador::chequear_error_operando(string &operando,int linea_codigo,string comando,string line,bool soportar_corchete){
    if(!operando_check(operando,soportar_corchete)){
        cout<<"parametro invalido, linea: "<<linea_codigo+1<<endl;
        cout<<comando<<" "<<line<<endl;
        exit(-1);
    }
}
void ensamblador::eliminar_comentarios(string &linea){
    linea= trim_espacios(linea);
    linea = linea.substr(0,linea.find(';')); //elimino los comentarios
}

void ensamblador::chequear_destino_valido(string operando,int linea_codigo,string comando,string line){
    if(es_constante(operando)){
        cout<<"Error al compilar, no se puede hacer "<<comando<<" con destino constante, linea: "<<linea_codigo+1<<endl;
        cout<<comando<<" "<<line<<endl;
        exit(-1);
    }
}

void ensamblador::buscar_etiquetas(string &line,int linea_leida,int linea_codigo){
    size_t label_pos = line.find(':');
    if (label_pos != string::npos){
        string label=line.substr(0,label_pos);
        line=line.substr(label_pos+1); //linea sin comentario y sin etiqueta
        if(string_fragmentado(label)||hay_simbolos_reservados_check(label)){
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

int  ensamblador::construir_instruccion_por_referencia_sin_shifter(vector<string> &program,string &primer_op,string &segundo_op,int &linea_leida){
    agregar_var("@7");
    agregar_var("@1");
    agregar_var("@0");
    string contador_shift="VARIABLE_AUXILIAR_ASM_###_Asquerosa_Imposible_de_Repetir";
    agregar_var(contador_shift);
    int pos_intruccion_creada=linea_leida+10;
    if(!es_x_referencia(segundo_op)){
        pos_intruccion_creada++;
    }
    if(es_x_referencia(primer_op)){
        primer_op=primer_op.substr(1,primer_op.find(']')-1);
        program.push_back("MOV "+primer_op+","+int_a_string(pos_intruccion_creada));               //      MOV a,X
    }
    else{
        agregar_lea(primer_op);
        program.push_back("LEA "+primer_op+","+int_a_string(pos_intruccion_creada));
    }
    program.push_back("MOV @0,"+contador_shift);                                   //      MOV @0,Contador Loop
    program.push_back("CMP @7,"+contador_shift);                                   //loop: CMP CONTADOR_LOOP,7
    program.push_back("BEQ "+int_a_string(linea_leida+8));                          //      BEQ FIN
    program.push_back("ADD "+int_a_string(pos_intruccion_creada)+","+int_a_string(pos_intruccion_creada)); //      ADD X,X
    program.push_back("ADD @1,"+contador_shift);                                   //      INC contador_loop
    program.push_back("CMP 0,0");                                                  //      CMP 0,                  0
    program.push_back("BEQ "+int_a_string(linea_leida+2));                              //      BEQ loop
    if(es_x_referencia(segundo_op)){        //Mov [A],[B]
        segundo_op=segundo_op.substr(1,segundo_op.find(']')-1) ;
        program.push_back("ADD "+segundo_op+","+int_a_string(pos_intruccion_creada));          //      ADD B,X
        linea_leida+=11;
    }
    else{ //Mov [A],B
        agregar_lea(segundo_op);
        program.push_back("LEA "+segundo_op+","+contador_shift);                   //      LEA B,var
        program.push_back("ADD "+contador_shift+","+int_a_string(pos_intruccion_creada));      //      ADD var,X
        linea_leida+=12;
    }
    return pos_intruccion_creada;
}

int ensamblador::construir_instruccion_por_referencia(vector<string> &program,string &primer_op,string &segundo_op,int &linea_leida){
    agregar_var("@7");
    int pos_intruccion_creada=linea_leida+5 ;
    if(!es_x_referencia(segundo_op)){
        pos_intruccion_creada++;
    }
    if(es_x_referencia(primer_op)){
        primer_op=primer_op.substr(1,primer_op.find(']')-1);
        program.push_back("OUT "+etiquetas_ES.find("SHIFTER_REG0")->second+","+primer_op);           //      MOV a,X
    }
    else{
        agregar_lea(primer_op);
        pos_intruccion_creada++;
        program.push_back("LEA "+primer_op+","+int_a_string(pos_intruccion_creada));
        program.push_back("OUT "+etiquetas_ES.find("SHIFTER_REG0")->second+","+int_a_string(pos_intruccion_creada));
        linea_leida++;
    }
    program.push_back("OUT "+etiquetas_ES.find("SHIFTER_REG1")->second+",@7");
    program.push_back("IN "+etiquetas_ES.find("SHIFTER_REG2")->second+","+int_a_string(pos_intruccion_creada));
    if(es_x_referencia(segundo_op)){//Mov [A],[B]
        segundo_op=segundo_op.substr(1,segundo_op.find(']')-1) ;
        program.push_back("ADD "+segundo_op+","+int_a_string(pos_intruccion_creada));          //      ADD B,X
        linea_leida+=6;
    }
    else{ //Mov [A],B
        agregar_lea(segundo_op);
        string variable_auxiliar="VARIABLE_AUXILIAR_ASM_###_Asquerosa_Imposible_de_Repetir";
        program.push_back("LEA "+segundo_op+","+variable_auxiliar);                   //      LEA B,var
        agregar_var(variable_auxiliar);
        program.push_back("ADD "+variable_auxiliar+","+int_a_string(pos_intruccion_creada));      //      ADD var,X
        linea_leida+=7;
    }
    return pos_intruccion_creada;
}
//quita los comentarios y va reconociendo las etiquetas, variables y constantes para poder direccionarlas despues
bool ensamblador::parser(ifstream &input_file){
    vector<string> program;
    string line;
    string comando_limpio;
    int linea_leida=0;
    int linea_file=0;

    while(getline(input_file, line)){
        eliminar_comentarios(line);                       //elimino los espacios hasta el primer caracter valido
        if(!line.empty()){                             //si la linea que queda no es nula
            buscar_etiquetas(line,linea_leida,linea_file); //
            line= trim_espacios(line);
            string comando=line.substr(0,line.find_first_of(" \t"));//busca instruccion
            string primer_op;
            string segundo_op;
            if(!comando.empty()){
                comando=caps_UP(comando);       //lo convierto a mayusculas para no tener problemas
                if((comando=="RET")){
                    program.push_back(comando+" "+line);
                    linea_leida++;
                }
                else{
                    if(line.find_first_of(" \t")==string::npos){
                        cout<<"Error al compilar, parametro faltante, linea: "<<linea_file+1<<endl;
                        cout<<comando<<endl;
                        exit(-1);
                    }
                    line=line.substr(line.find_first_of(" \t"));//lineas con operandos
                    line=trim_espacios(line);
                }
                if(instructions_codes.find(comando)!= instructions_codes.end()){
                    if((comando=="BEQ")||(comando=="CALL")||(comando=="DW")||
                        (comando=="JMP")){
                        if(comando=="JMP"){
                            program.push_back("CMP 0,0");
                            linea_leida++;
                            comando="BEQ";
                        }
                        if(!operando_check(line)){
                            cout<<"parametro invalido, linea: "<<linea_file+1<<endl;
                            cout<<comando<<" "<<line<<endl;
                            exit(-1);
                        }
                        program.push_back(comando+" "+line);
                        linea_leida++;
                    }
                    else{
                        primer_op=line.substr(0,line.find(',')); //busca primer operando
                        segundo_op=line.substr(line.find(',')+1); //busca segundo operando
                        if(comando=="INC"){
                            chequear_error_operando(primer_op,linea_file,comando,line);
                            agregar_var("@1");
                            agregar_var(primer_op);
                            program.push_back("ADD @1,"+primer_op);
                            linea_leida++;
                        }
                        if(comando=="DEC"){
                            chequear_error_operando(primer_op,linea_file,comando,line);
                            agregar_var(primer_op);
                            agregar_var("@65535");
                            program.push_back("ADD @65535,"+primer_op);
                            linea_leida++;
                        }
                        if(comando=="SUB"){
                            chequear_error_operando(primer_op,linea_file,comando,line);
                            chequear_error_operando(segundo_op,linea_file,comando,line);
                            chequear_destino_valido(primer_op,linea_file,comando,line);
                            agregar_var(primer_op);
                            agregar_var(segundo_op);
                            string variable_auxiliar="VARIABLE_AUXILIAR_ASM_###_Asquerosa_Imposible_de_Repetir";
                            agregar_var(variable_auxiliar);
                            #ifdef USE_ALM
                                agregar_var("@1");
                                string operacion_ALM=etiquetas_ES.find("ALM_NOT")->second;
                                agregar_var(operacion_ALM);
                                program.push_back("OUT "+etiquetas_ES.find("ALM_REG2")->second+","+operacion_ALM);
                                program.push_back("OUT "+etiquetas_ES.find("ALM_REG0")->second+","+segundo_op);
                                program.push_back("IN "+etiquetas_ES.find("ALM_REG3")->second+","+variable_auxiliar);
                                program.push_back("ADD @1,"+variable_auxiliar);
                                program.push_back("ADD "+variable_auxiliar+","+primer_op);
                                linea_leida+=5;
                            #else
                                agregar_var("@65535");
                                agregar_var("@0");
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
                            #endif
                        }
                        if(comando=="LEA"){
                            chequear_error_operando(primer_op,linea_file,comando,line);
                            chequear_error_operando(segundo_op,linea_file,comando,line);
                            chequear_destino_valido(segundo_op,linea_file,comando,line);
                            agregar_lea(primer_op);
                            if(es_direccion(primer_op)){
                                cout<<"ADVERTENCIA, LEA CARGA LITERAL EN POSICION DE MEMORIA"<<endl;
                                cout<<"LEA "<<primer_op<<","<<segundo_op<<" linea:"<<linea_file<<endl;
                            }
                            agregar_var(segundo_op);
                            program.push_back(comando+" "+primer_op+","+segundo_op);
                            linea_leida++;
                        }

                        if(comando=="ADD"){
                            chequear_error_operando(primer_op,linea_file,comando,line,true);
                            chequear_error_operando(segundo_op,linea_file,comando,line,true);
                            chequear_destino_valido(segundo_op,linea_file,comando,line);
                            if(es_x_referencia(primer_op)||es_x_referencia(segundo_op)){
                                agregar_var("@0");
                                #ifdef use_shifter
                                    int pos_instruccion_nueva=construir_instruccion_por_referencia(program,primer_op,segundo_op,linea_leida);                                  //x:    MOV A,0
                                #else
                                    int pos_instruccion_nueva=construir_instruccion_por_referencia_sin_shifter(program,primer_op,segundo_op,linea_leida);
                                #endif
                                program.push_back("ADD @0,"+int_a_string(pos_instruccion_nueva));
                                program.push_back("ADD "+primer_op+",0");   
                            }
                            else{
                                program.push_back(comando+" "+primer_op+","+segundo_op);
                                linea_leida++;
                            }
                        }
                        if(comando=="MOV"){
                            chequear_error_operando(segundo_op,linea_file,comando,line,true);
                            chequear_error_operando(primer_op,linea_file,comando,line,true);
                            chequear_destino_valido(segundo_op,linea_file,comando,line);
                            if(es_x_referencia(primer_op)||es_x_referencia(segundo_op)){
                                agregar_var("@32768");
                                #ifdef use_shifter
                                    int pos_instruccion_nueva=construir_instruccion_por_referencia(program,primer_op,segundo_op,linea_leida);                                  //x:    MOV A,0
                                #else
                                    int pos_instruccion_nueva=construir_instruccion_por_referencia_sin_shifter(program,primer_op,segundo_op,linea_leida);
                                #endif
                                program.push_back("ADD @32768,"+int_a_string(pos_instruccion_nueva));
                                program.push_back("MOV "+primer_op+",0");   
                            }
                            else{
                                //MOV A,B
                                program.push_back(comando+" "+primer_op+","+segundo_op);
                                linea_leida++;
                            }
                            agregar_var(primer_op);
                            agregar_var(segundo_op);
                        }
                        #ifdef use_shifter
                        //shiftl x,desplazamiento
                        if(comando=="SHIFTR"||comando=="SHIFTL"){
                            chequear_error_operando(primer_op,linea_file,comando,line);
                            chequear_error_operando(segundo_op,linea_file,comando,line);
                            chequear_destino_valido(primer_op,linea_file,comando,line);
                            agregar_var(primer_op);
                            agregar_var(segundo_op);
                            program.push_back("OUT "+etiquetas_ES.find("SHIFTER_REG0")->second+","+primer_op);
                            program.push_back("OUT "+etiquetas_ES.find("SHIFTER_REG1")->second+","+segundo_op);
                            if(comando=="SHIFTL"){
                                program.push_back("IN "+etiquetas_ES.find("SHIFTER_REG2")->second+","+primer_op);
                                cout<<"shift izq"<<endl;
                            }
                            else{
                                cout<<"shift der"<<endl;
                                program.push_back("IN "+etiquetas_ES.find("SHIFTER_REG3")->second+","+primer_op);
                            }
                            linea_leida+=3;
                        }
                        #endif
                        if(comando=="CMP") {
                            chequear_error_operando(primer_op,linea_file,comando,line,true);
                            chequear_error_operando(segundo_op,linea_file,comando,line,true);
                            agregar_var(primer_op);
                            agregar_var(segundo_op);
                            if(es_x_referencia(primer_op)||es_x_referencia(segundo_op)){
                                agregar_var("@16384");
                                #ifdef use_shifter
                                    int pos_instruccion_nueva=construir_instruccion_por_referencia(program,primer_op,segundo_op,linea_leida);                                  //x:    MOV A,0
                                #else
                                    int pos_instruccion_nueva=construir_instruccion_por_referencia_sin_shifter(program,primer_op,segundo_op,linea_leida);
                                #endif
                                program.push_back("ADD @16384,"+int_a_string(pos_instruccion_nueva));
                                program.push_back("CMP "+primer_op+",0");   
                            }
                            else{
                                program.push_back(comando+" "+primer_op+","+segundo_op);
                                linea_leida++;
                            }
                        }
                        if((comando=="IN")||(comando=="OUT")){
                            chequear_error_operando(primer_op,linea_file,comando,line);
                            chequear_error_operando(segundo_op,linea_file,comando,line);
                            if(comando=="IN"){
                                chequear_destino_valido(segundo_op,linea_file,comando,line);
                            }
                            if(!es_direccion(primer_op)){
                                primer_op=caps_UP(primer_op);
                                map<string,string>::iterator it=etiquetas_ES.find(primer_op);
                                if(it==etiquetas_ES.end()){
                                    cout<<"Error al compilar: "<<comando<<" designa un puerto invalido, linea "<<linea_file+1<<endl;
                                    cout<<comando<<" "<<line<<endl;
                                    exit(-1);
                                }
                                primer_op=it->second;
                            }
                            if(atoi (primer_op.c_str())>=32){
                                cout<<"Error al compilar: "<<comando<<" designa un puerto invalido, linea "<<linea_file+1<<endl;
                                cout<<comando<<" "<<line<<endl;
                                exit(-1);
                            }
                            agregar_var(segundo_op);
                            program.push_back(comando+" "+primer_op+","+segundo_op);
                            linea_leida++;
                        }
                    }
                }
                else{
                        cout<<"Error al compilar: instruccion invalida en linea "<<linea_file+1<<endl;
                        cout<<comando+" "+line<<endl;
                        exit(-3);
                }
            }

        }
        linea_file++;
    }
    codigo_limpio=program;
    return true;
}

void ensamblador::inicializar_etiquetas_ES(){
    #ifdef USE_ALM
    etiquetas_ES.insert ( pair<string,string>("ALM_AND","0") );
    etiquetas_ES.insert ( pair<string,string>("ALM_OR","1") );
    etiquetas_ES.insert ( pair<string,string>("ALM_NOT","2") );
    etiquetas_ES.insert ( pair<string,string>("ALM_NAND","3") );
    etiquetas_ES.insert ( pair<string,string>("ALM_XOR","4") );
    etiquetas_ES.insert ( pair<string,string>("ALM_NOR","5") );
    etiquetas_ES.insert ( pair<string,string>("ALM_XNOR","6") );
    etiquetas_ES.insert ( pair<string,string>("ALM_BITSEL","7") );
    etiquetas_ES.insert ( pair<string,string>("ALM_MERGE_H","8") );
    etiquetas_ES.insert ( pair<string,string>("ALM_MERGE_L","9") );
    etiquetas_ES.insert ( pair<string,string>("ALM_MERGE_HL","10") );
    etiquetas_ES.insert ( pair<string,string>("ALM_MERGE_LH","11") );
    etiquetas_ES.insert ( pair<string,string>("ALM_SWAP_HL","12") );   

    etiquetas_ES.insert ( pair<string,string>("ALM_REG0","0") );
    etiquetas_ES.insert ( pair<string,string>("ALM_REG1","1") );
    etiquetas_ES.insert ( pair<string,string>("ALM_REG2","2") );
    etiquetas_ES.insert ( pair<string,string>("ALM_REG3","3") ); 
    #endif
    #ifdef use_shifter
    etiquetas_ES.insert ( pair<string,string>("SHIFTER_REG0","4") );
    etiquetas_ES.insert ( pair<string,string>("SHIFTER_REG1","5") );
    etiquetas_ES.insert ( pair<string,string>("SHIFTER_REG2","6") );
    etiquetas_ES.insert ( pair<string,string>("SHIFTER_REG3","7") );
    #endif
    etiquetas_ES.insert ( pair<string,string>("TIMER_ROUNDS","8") );
    etiquetas_ES.insert ( pair<string,string>("TIMER_PRESCALER","9") );
    etiquetas_ES.insert ( pair<string,string>("TIMER_STATUS","10") );
    etiquetas_ES.insert ( pair<string,string>("TIMER_DONE","11") );
    etiquetas_ES.insert ( pair<string,string>("TIMER_ROUNDS_GOAL","8") );
    etiquetas_ES.insert ( pair<string,string>("TIMER_PRESCALER_GOAL","9") );
    etiquetas_ES.insert ( pair<string,string>("TIMER_START","10") );
    etiquetas_ES.insert ( pair<string,string>("TIMER_RESET","11") );
    etiquetas_ES.insert ( pair<string,string>("UART_TX","12") );
    etiquetas_ES.insert ( pair<string,string>("UART_RX","13") );
    etiquetas_ES.insert ( pair<string,string>("UART_FULL","14") );
    etiquetas_ES.insert ( pair<string,string>("UART_EMPTY","15") );
    etiquetas_ES.insert ( pair<string,string>("SSEG","16") );
    etiquetas_ES.insert ( pair<string,string>("BTNS","20") );
    etiquetas_ES.insert ( pair<string,string>("SWT","24") );
    etiquetas_ES.insert ( pair<string,string>("LED","28") );
}
void ensamblador::inicializar_instrucciones(){
    //defino los valores del codigo aca
    //instrucciones con dos parametros 7 bits
    instructions_codes.insert ( pair<string,string>("ADD","00") );
    instructions_codes.insert ( pair<string,string>("CMP","01") );
    instructions_codes.insert ( pair<string,string>("MOV","10") );
    instructions_codes.insert ( pair<string,string>("LEA","10") );
    instructions_codes.insert ( pair<string,string>("SUB","") );
    //instruccion con 1 parametro de 5 bits y uno de 7
    instructions_codes.insert ( pair<string,string>("IN",  "1110") );
    instructions_codes.insert ( pair<string,string>("OUT", "1111") );
    //instruccion con 1 parametro de 7
    instructions_codes.insert ( pair<string,string>("BEQ", "110000000") );
    instructions_codes.insert ( pair<string,string>("CALL","110010000") );
    instructions_codes.insert ( pair<string,string>("RET", "110011000") );
    instructions_codes.insert ( pair<string,string>("JMP", "") );
    instructions_codes.insert ( pair<string,string>("INC", "") );
    instructions_codes.insert ( pair<string,string>("DEC", "") );
    //instruccion con 1 parametro de 4 bits y uno de 7
    #ifdef use_shifter
    instructions_codes.insert ( pair<string,string>("SHIFTL", "") );
    instructions_codes.insert ( pair<string,string>("SHIFTR", "") );
    #endif
    //instruccion de ensamble de 16 bits
    instructions_codes.insert ( pair<string,string>("DW","") );
    //
}

bool ensamblador::abrir(string filename){
    ifstream input_file_fstream(filename.c_str());
    if(input_file_fstream.fail()){
        cerr << "No se pudo abrir archivo de entrada" << endl;
        return false;
    }
    parser(input_file_fstream);
    input_file_fstream.close();

    return true;
}

bool ensamblador::guardar(string filename){
    ofstream output_file_fstream(filename.c_str());
    if(output_file_fstream.fail()){
        cerr << "No se pudo crear archivo de salida" << endl;
        return false;
    }
    for (unsigned int i=0;i<output.size();i++)
        output_file_fstream<<output[i]<<endl;
    output_file_fstream.close();
    return true;
}

bool ensamblador::procesar_asm(string filename){
    cout<<"abriendo archivo de entrada: "<< filename<<endl;
    abrir(filename);
    cout<<"optimizando memorias"<<endl;
    cout<<"generando codigo en lenguaje maquina"<<endl;
    vector<string> codigo_ensamblado=generador_codigo();
    cout<<"creando archivo de salida: "<<endl;
    cout<<"creando archivo de salida: "<<endl;
    string archivo_out=filename.substr(0,filename.find_last_of('.'))+".hex";
    guardar(archivo_out);
    cout<<"Archivo generado "<<archivo_out<<",tamanio del programa: "<<codigo_ensamblado.size()<<endl;
    cout<<"Memoria libre restante "<<MAX_SIZE_CODE-codigo_ensamblado.size()<<endl;
    return true;
}

#endif
