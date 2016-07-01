# Macros
program_NAME=comp
program_NAME2=desasm
INCLUDE=../include/
CFLAGS = -g -std=c++11 -Wall -I$(INCLUDE)
CC = g++ $(CFLAGS)
SRC = compilador.cpp
OBJ = main.o 
SRC2= desensamblador.cpp
OBJ2 = desasm.o 

# Reglas expl�citas
.PHONY: all clean
all:
	$(CC) $(SRC) -o main
	$(CC) $(SRC2) -o desasm
clean:
	$(RM) $(OBJ) main
	$(RM) $(OBJ2) desasm
