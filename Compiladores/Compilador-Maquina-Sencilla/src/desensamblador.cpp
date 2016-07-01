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
//SOPORTE EXPERIMENTAL PARA WINDOWS, para usarlo descomentar la siguiente linea
//#define Windows_MODE
string int_a_string(int numero){
    string resultado;
    stringstream convert;
    convert << numero;
    resultado = convert.str();
    return resultado;
}

int bin_to_int(string a){
    int numero=0;
    for(unsigned int i=0;i<a.length();i++){
        if(a[i]=='1'){
            numero+=pow(2,a.length()-1-i);
        }
    }
    return numero;

}
string bin_to_dec(string a){
    int numero=bin_to_int(a);
    return int_a_string(numero);
}

int string_a_int(string a){
    return atoi(a.c_str());
}

string generar_label(int &labels_usados,int mem_pos,map <int, string> &labels){
    string res;
    if(labels.find(mem_pos)==labels.end()) {
        res="Label_"+int_a_string(labels_usados)+":";
        labels.insert ( pair<int,string>(mem_pos,res));
        labels_usados++;
    }
    else
        res=labels.find(mem_pos)->second;
    res=res.substr(0,res.find(":"));
    return res;
}

void reinsertar_label_codigo(vector<string> &codigo_reensamblado){
    vector<string> programa;
    string line;
    string comando;
    string operando;
    string linea_leida;
    int labels_usados=0;
    int line_ref;
    map <int, string> labels;
    unsigned int tamanio_codigo=codigo_reensamblado.size();
    for(unsigned int i=0;i<tamanio_codigo;i++){
        linea_leida=codigo_reensamblado[i];
        line=linea_leida.substr(0,linea_leida.find(' '));
        operando=linea_leida.substr(linea_leida.find(' ')+1);
        line_ref=string_a_int(operando);
        if((line=="BEQ")||(line=="CALL")){
            codigo_reensamblado[i]=line+" "+generar_label(labels_usados,line_ref,labels);
        }
    }
    for(unsigned int i=0;i<tamanio_codigo;i++){
        if(labels.find(i)!=labels.end()) {
            codigo_reensamblado[i]=(labels.find(i)->second)+codigo_reensamblado[i];
        }
    }
}

//reensambla
vector<string> reensamblar_codigo(ifstream &input_file){
    vector<string> programa;
    string line;
    string comando;
    string linea_leida;
    while(getline(input_file, line)){
        comando=line.substr(0,2);
        if(comando=="10"){
            linea_leida="MOV "+bin_to_dec(line.substr(2,7))+","+bin_to_dec(line.substr(9));
        }
        else
            if(comando=="00")
                linea_leida="ADD "+bin_to_dec(line.substr(2,7))+","+bin_to_dec(line.substr(9));         
            else
            if(comando=="01")
                linea_leida="CMP "+bin_to_dec(line.substr(2,7))+","+bin_to_dec(line.substr(9));
            else{
                comando=line.substr(0,4);
                if(comando=="1110")
                    linea_leida="IN "+bin_to_dec(line.substr(4,5))+","+bin_to_dec(line.substr(9));
                else
                    if(comando=="1111")
                        linea_leida="OUT "+bin_to_dec(line.substr(4,5))+","+bin_to_dec(line.substr(9));
                    else{
                        comando=line.substr(0,9);
                        if(comando=="110000000")
                            linea_leida="BEQ "+bin_to_dec(line.substr(9));
                        else
                            if(comando=="110010000")
                                linea_leida="CALL "+bin_to_dec(line.substr(9));
                            else
                                if(line=="1100110000000000")
                                    linea_leida="RET";
                                else
                                    linea_leida=line;
                        }
                }
        programa.push_back(linea_leida);
    }
    return programa;
}

/************************** MAIN ************************************/
int main(int argc,char * argv[]){

    vector<string> codigo_reensamblado;
    cout<<"Bienvenido al desensamblador"<<endl;
    
#ifdef Windows_MODE
    cout<<"MODO WINDOWS"<<endl;
    cout<<"Ingresar el nombre del archivo hex"<<endl;
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
        archivo_out=archivo_in.substr(0,archivo_in.find_last_of('.'))+"-reassembly.asm";   
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
    cout<<"leyendo archivo de entrada"<<endl;
    codigo_reensamblado=reensamblar_codigo(input_file_fstream);
    reinsertar_label_codigo(codigo_reensamblado);
    input_file_fstream.close();
    cout<<"generando archivo de salida: "<<endl;  
    ofstream output_file_fstream(archivo_out.c_str());
    if(output_file_fstream.fail()){
        cerr << "No se pudo crear archivo de salida" << std::endl;
        return -2;
    }
    for (unsigned int i=0;i<codigo_reensamblado.size();i++)
        output_file_fstream<<codigo_reensamblado[i]<<endl;

    output_file_fstream.close();
    cout<<"archivo reensamblado "<<archivo_out<<",tamanio del programa: "<<codigo_reensamblado.size()<<endl;
    return 0;
}