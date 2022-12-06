# Makefile for mandelbrot area code

#
# C compiler and options
#
CC=   cc -O3 -fopenmp

#
# Object files
#
OBJ=	 coherency.o 

#
# Compile
#
coherency:	$(OBJ)
	$(CC) -o $@ $(OBJ) 

.c.o:
	$(CC) -c $< 

#
# Clean out object files and the executable.
#
clean:
	rm -f *.o coherency
