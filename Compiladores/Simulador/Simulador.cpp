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
#define MAX_CALL 128
#define DEFAULT_CYCLE 500000
using namespace std;
//SOPORTE EXPERIMENTAL PARA WINDOWS, para usarlo descomentar la siguiente linea
//#define Windows_MODE

int reg_0_shifter=0;
int reg_1_shifter=0;
int reg_2_shifter=0;
int reg_3_shifter=0;

string int_a_string(int numero){
    string resultado;
    stringstream convert;
    convert << numero;
    resultado = convert.str();
    return resultado;
}

int bin_to_int(string a){
    int numero=0;
    for(int i=0;i<a.length();i++){
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

int modulo_in_shifter(int registro){
    int valor=0;
    switch(registro){
        case 3:
            valor=reg_0_shifter>>(reg_1_shifter);
        break;
        case 2: 
            valor=reg_0_shifter<<(reg_1_shifter);
        break;
        default:cout<<"error de lectura del registro shifter"<<endl;
        break;
    }
    return valor;
}

void modulo_out_shifter(int registro,int valor){
    switch(registro){
        case 0:reg_0_shifter=valor;
        break;
        case 1:reg_1_shifter=valor;
        break;
        default:cout<<"error de escritura del registro shifter"<<endl;
        break;
    }
}

void modulo_out_uart(int registro,int valor){
    switch(registro){
        case 0:cout<<"Salida UART_TX: "<<int_a_binario(valor,16)<<endl;
        break;
        case 2:cout<<"Salida UART_reset: "<<int_a_binario(valor,16)<<endl;
        break;
        default:cout<<"error de escritura del registro UART, registro "<<registro<<endl;
        break;
    }
}

void modulo_out_led(int registro,int valor){
    switch(registro){
        case 0:cout<<"Salida LED: "<<int_a_binario(valor,16)<<endl;
        break;
        default:cout<<"error de escritura del registro LED"<<endl;
        break;
    }
}

void modulo_out_sseg(int registro,int valor){
    switch(registro){
        case 0:cout<<"Salida Siete Segmentos: "<<int_a_binario(valor,16)<<endl;
        break;
        default:cout<<"error de escritura del registro SSEG"<<endl;
        break;
    }
}


bool ejecucion(vector<string> &programa,int ciclos){
    
    string line;
    string comando;
    string linea_leida;
    int operando1;
    int operando2;
    bool flag_Z=false;
    int pointer=0;
    vector<int> stack_pointer;
    int call_ejecutado=0;
    for(int ciclo_ejecutado=0;ciclo_ejecutado<ciclos;ciclo_ejecutado++){
        line=programa[pointer];
        comando=line.substr(0,2);
        operando1=bin_to_int(line.substr(2,7));
        operando2=bin_to_int(line.substr(9));
        if(comando=="10"){
            //MOV
            programa[operando2]=programa[operando1];
        }
        else
            if(comando=="00"){
                //ADD
                int suma=bin_to_int(programa[operando1])+bin_to_int(programa[operando2]);
                programa[operando2]=int_a_binario(suma,16);
                if(suma%65536==0)
                    flag_Z=true;
                else
                    flag_Z=false;
            }  
            else
            if(comando=="01"){
                //CMP
                if(programa[operando1]==programa[operando2])
                    flag_Z=true;
                else
                    flag_Z=false;
            }
            else{
                comando=line.substr(0,4);
                if(comando=="1110"){
                    //IN
                    int res=0;
                    operando1=bin_to_int(line.substr(4,5));
                    int registro=operando1%4;
                    int device=(operando1-registro)/4;
                    //cout<<"IN device: "<<device<<" registro: "<<registro<<endl;
                    switch(device){
                        case 1:res=modulo_in_shifter(registro);
                        break;
                        default:cout<<"modulo desconectado"<<endl;
                        break;
                    }
                    programa[operando2]=int_a_binario(res,16);
                }
                else
                    if(comando=="1111"){
                        //OUT
                        operando1=bin_to_int(line.substr(4,5));
                        int valor=bin_to_int(programa[operando2]);
                        int registro=operando1%4;
                        int device=(operando1-registro)/4;
                        //cout<<"OUT device: "<<device<<" registro: "<<registro<<endl;
                        switch(device){
                            case 1:modulo_out_shifter(registro,valor);
                            break;
                            case 3:modulo_out_uart(registro,valor);
                            break;
                            case 4:modulo_out_sseg(registro,valor);
                            break;
                            case 7:modulo_out_led(registro,valor);
                            break;
                            default:cout<<"modulo desconectado"<<endl;
                            break;
                        }
                    }
                    else{
                        comando=line.substr(0,9);
                        if(comando=="110000000"){
                            //BEQ
                            if(flag_Z){
                                pointer=operando2;
                                pointer--;
                            }

                        }
                        else
                            if(comando=="110010000"){
                                //CALL
                                stack_pointer.push_back(pointer);
                                pointer=operando2;
                                call_ejecutado++;
                                if(call_ejecutado>MAX_CALL){
                                    cout<<"ERROR No se puede ejecutar call, memoria llena"<<endl;
                                    cout<<"Intrucciones ejecutadas: "<<ciclo_ejecutado<<endl;
                                    return false;
                                }
                                pointer--;
                            }
                            else
                                if(comando=="110011000"){
                                    //RET
                                    if(stack_pointer.empty()){
                                        cout<<"ERROR No se puede retornar"<<endl;
                                        cout<<"Intrucciones ejecutadas: "<<ciclo_ejecutado<<endl;
                                        return false;
                                    }
                                    pointer=stack_pointer.back();
                                    pointer--;
                                    stack_pointer.pop_back();
                                    call_ejecutado--;
                                }
                                else{
                                    cout<<"ERROR Instruccion Leida Invalida, Linea:"<<pointer<<endl;
                                    cout<<"Intrucciones ejecutadas: "<<ciclo_ejecutado<<endl;
                                    return false;
                                }
                        }
                }
            pointer++;
            if(pointer>=MAX_SIZE_CODE){
                cout<<"Direccion invalida"<<endl;
                cout<<"Intrucciones ejecutadas: "<<ciclo_ejecutado<<endl;
                return false;
            }
    }
    return true;
}

vector<string> cargar_codigo(ifstream &input_file){
    vector<string> programa;
    string line;
    int linea_leida=0;
    while(getline(input_file, line)&&linea_leida<MAX_SIZE_CODE){
        if(line.length()!=0){
            programa.push_back(line);
            linea_leida++;
        }
    }
    for(int i=linea_leida;i<MAX_SIZE_CODE;i++){
        programa.push_back(int_a_binario(0,16));
    }

    return programa;
}

/************************** MAIN ************************************/
int main(int argc,char * argv[]){

    vector<string> codigo;
    cout<<"Bienvenido al simulador"<<endl;
    int numero_ciclos=0;
#ifdef Windows_MODE
    cout<<"MODO WINDOWS"<<endl;
    cout<<"Ingresar el nombre del archivo hex"<<endl;
    string archivo_in;
    getline(cin,archivo_in);
    numero_ciclos=DEFAULT_CYCLE;
#else
    cout<<"MODO LINUX"<<endl;
    string archivo_in=string(argv[1]);
    if((argc < 2)) {
        cout << "El programa debe al menos 2 parametros" << std::endl;
        cout << "El formato correcto de ejecucion es: ./simulador archivo_hex [#ciclos_ejecucion --opcional]" << std::endl;
        return -1;
    }
    if((argc > 2)) {
        numero_ciclos=atoi(argv[2]);
    }
    else
        numero_ciclos=DEFAULT_CYCLE;
#endif
    string archivo_out;
    archivo_out=archivo_in.substr(0,archivo_in.find_last_of('.'))+"-output.hex";   
    cout<<"Abriendo archivo de entrada: "<< archivo_in<<endl;
    ifstream input_file_fstream(archivo_in.c_str()); 
    if(input_file_fstream.fail()){
        cerr << "No se pudo abrir archivo de entrada" << std::endl;
        return -2;
    }
    cout<<"Cargando programa"<<endl;
    codigo=cargar_codigo(input_file_fstream);
    cout<<"Ejecutando programa"<<endl;
    ejecucion(codigo,numero_ciclos);
    input_file_fstream.close();
    cout<<"Generando archivo de salida: "<<endl;  
    ofstream output_file_fstream(archivo_out.c_str());
    if(output_file_fstream.fail()){
        cerr << "No se pudo crear archivo de salida" << std::endl;
        return -2;
    }
    for (unsigned int i=0;i<codigo.size();i++)
        output_file_fstream<<codigo[i]<<endl;
    output_file_fstream.close();
    cout<<"Resultado de la ejecucion"<<archivo_out<<endl;
    return 0;
}
