SHELL := /bin/bash

FILES=$(wildcard *.lama)
ALL=$(sort $(FILES:.lama=.o))
LAMAC=lamac
TARGET=RandomShrinkers

all: $(ALL) target

target: $(TARGET).o
	$(LAMAC) -I . $(TARGET).lama

SatSolverTests.o: RandomShrinkers.o

%.o: %.lama
	$(LAMAC) -I . -c $<

clean:
	rm -Rf *.s *.o *.i *~
	pushd regression && make clean && popd

