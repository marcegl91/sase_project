#include <iostream>
#include <fstream>
#include <stdlib.h>
#include <vector>
//define el maximo tamanio de codigo
#define MAX_SIZE_CODE 128
//define cuantos call usa antes de tirar el warning
#define WARNING_CALL_STACK 10
//implementa funciones con shifter
#define use_shifter
//implementa funciones con ALM (sin soportar aun)
//#define USE_ALM
#include "ensamblador.h"

//SOPORTE EXPERIMENTAL PARA WINDOWS, para usarlo descomentar la siguiente linea
//#define Windows_MODE
using namespace std;

/************************** MAIN ************************************/
int main(int argc,char * argv[]){

    vector<string> codigo_limpio;
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
        cout << "El programa debe recibir al menos 1 parametro (archivo a ensamblar)" << endl;
        cout << "El formato correcto de ejecucion es: ./main archivo_assembler [archivo_salida --opcional]" << endl;
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
    ensamblador ensamble;
    cout<<"abriendo archivo de entrada: "<< archivo_in<<endl;
    ensamble.abrir(archivo_in);
    cout<<"optimizando memorias"<<endl;
    ensamble.optimizar_memoria();
    cout<<"generando codigo en lenguaje maquina"<<endl;
    vector<string> codigo_ensamblado=ensamble.generador_codigo();
    cout<<"creando archivo de salida: "<<endl;
    ensamble.guardar(archivo_out);
    cout<<"Archivo generado "<<archivo_out<<",tamanio del programa: "<<codigo_ensamblado.size()<<endl;
    cout<<"Memoria libre restante "<<MAX_SIZE_CODE-codigo_ensamblado.size()<<endl;
    return 0;
}
