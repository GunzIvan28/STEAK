CC=mpic++
CFLAGS=-std=c++11 -fopenmp
LFLAGS=-lboost_program_options -lboost_thread -lboost_system -fopenmp

all: steak

steak: parallelenvironment.o buffer.o inputfile.o outputfile.o process.o samdata.o data.o smithwaterman.o ssw.o ssw_cpp.o main.o
	${CC} parallelenvironment.o buffer.o inputfile.o outputfile.o process.o samdata.o data.o smithwaterman.o ssw.o ssw_cpp.o main.o -o steak ${LFLAGS}

main.o: main.cpp
	${CC} -c main.cpp ${CFLAGS}

parallelenvironment.o: parallelenvironment.hpp parallelenvironment.cpp
	${CC} -c parallelenvironment.cpp ${CFLAGS}

inputfile.o: inputfile.hpp inputfile.cpp
	${CC} -c inputfile.cpp ${CFLAGS}

outputfile.o: outputfile.hpp outputfile.cpp
	${CC} -c outputfile.cpp ${CFLAGS}

process.o: process.hpp process.cpp
	${CC} -c process.cpp ${CFLAGS}

samdata.o: samdata.hpp samdata.cpp
	${CC} -c samdata.cpp ${CFLAGS}

data.o: data.hpp data.cpp
	${CC} -c data.cpp ${CFLAGS}

buffer.o: buffer.hpp buffer.cpp
	${CC} -c buffer.cpp ${CFLAGS}

smithwaterman.o: smithwaterman.hpp smithwaterman.cpp
	${CC} -c smithwaterman.cpp ${CFLAGS}

ssw.o: ssw.h ssw.c
	${CC} -c ssw.c ${CFLAGS}

ssw_cpp.o: ssw_cpp.h ssw_cpp.cpp
	${CC} -c ssw_cpp.cpp ${CFLAGS}

clean:
	rm steak *.o
