DUCKFILES = $(wildcard duck/*.duck)
INOFILES = $(subst duck,ino,$(DUCKFILES:.duck=.ino))

DUCK2SPARK = ~/repos/duck2spark/duck2spark.py
DUCKENCODER = ~/repos/duckencoder.py/duckencoder.py
PYTHON = python2

all: ${INOFILES}

ino/%.ino: bin/%.bin
	${PYTHON} ${DUCK2SPARK} -i $^ -l 1 -f 1000 -o $@

bin/%.bin: duck/%.duck
	${PYTHON} ${DUCKENCODER} -i $^ -l sv -o $@

.PHONY: clean
clean:
	rm -f ino/*
