# Macros
program_NAME=comp
program_NAME2=desasm
CC = g++
CFLAGS = -g -Wall
SRC = Compilador.cpp
OBJ = main.o 
SRC2= Desensamblador.cpp
OBJ2 = desasm.o 

# Reglas expl�citas
.PHONY: all clean
all:
	$(CC) $(SRC) -o main
	$(CC) $(SRC2) -o desasm
clean:
	$(RM) $(OBJ) main
	$(RM) $(OBJ2) desasm
