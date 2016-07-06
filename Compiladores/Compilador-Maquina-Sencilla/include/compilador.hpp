#ifndef _ASM_MS_H
#define _ASM_MS_H

#include <fstream>
#include <string>
#include <vector>
#include <unordered_map>
#include <map>

typedef std::string label;
typedef std::unsigned char address;

class instruction
{
    private:
        std::vector<std::string> operands;
        std::string instruction;

    public:
        instruction(const std::string&);
        instruction(const instruction&);
        std::unsigned short bytecode(const std::unordered_map<label,const address>&) const;
        std::vector<std::string>::iterator begin();
        std::vector<std::string>::const_iterator cbegin() const;
        std::vector<std::string>::iterator end();
        std::vector<std::string>::const_iterator cend() const;
}

class program
{
    private:
        //Attributes
        std::vector<const instruction> instructions;
        std::unordered_map<label,const address> labels;
        std::unordered_map<std::string,const std::unsigned char> isa;

    public:
        program(const std::ifstream&);
        program(const program&);
        void print_object_code(std::ofstream&) const;
        void print_machine_code(std::ofstream&) const;
}

bool es_variable(std::string);
bool es_direccion(std::string);
bool es_constante(std::string);
bool es_x_referencia(std::string);
std::string int_a_binario(int num,int tam_binario);
std::string int_a_string(int);
int string_a_int(std::string);
std::string caps_UP(std::string);
std::string trim_espacios(std::string);
bool hay_simbolos_reservados_check(std::string);
bool direccion_check(std::string);
bool limpiar_espacios(std::string&);
bool operando_check(std::string&);
std::string address_solver(std::string var,
    std::map <std::string,int> etiquetas,
    std::map <std::string,int> variables,
    std::map <std::string,int> &lea_address);
int ver_si_existe_constante(int var,std::map <std::string,int> &variables);
void optimizar_memoria(int pos_inicial,
    std::map <std::string,int> &etiquetas,
    std::map <std::string,int> &variables,
    std::map <std::string,int> &lea_address);
std::vector<std::string> generador_codigo(std::vector<std::string> codigo_limpio,
    std::map <std::string,int> etiquetas,
    std::map <std::string,int> variables,
    std::map <std::string,int> &lea_address);
bool agregar_var(std::string var, std::map <std::string,int> &variables);
void agregar_lea(std::string var,std::map <std::string,int> &lea_address);
void chequear_error_operando(std::string &operando,
    int linea_codigo,
    std::string comando,
    std::string line);
void eliminar_comentarios(std::string &linea);
void chequear_destino_valido(std::string operando,
    int linea_codigo,
    std::string comando,
    std::string line);
void buscar_etiquetas(std::string &line,
    int linea_leida,
    std::map <std::string,int> &etiquetas,
    int linea_codigo);
std::vector<std::string> parser(std::ifstream &input_file,
    std::map <std::string,int> &etiquetas,
    std::map <std::string,int> &variables,
    std::map <std::string,int> &lea_address);
void inicializar_etiquetas_ES();
void inicializar_instrucciones();

#endif _ASM_MS_H
