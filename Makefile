DUCKFILES = $(wildcard duck/*.duck)
INOFILES = $(subst duck,ino,$(DUCKFILES:.duck=.ino))

DUCK2SPARK = ~/repos/duck2spark/duck2spark.py
DUCKENCODER = ~/repos/duckencoder.py/duckencoder.py

all: ${INOFILES}

ino/%.ino: bin/%.bin
	python ${DUCK2SPARK} -i $^ -l 1 -f 1000 -o $@

bin/%.bin: duck/%.duck
	python ${DUCKENCODER} -i $^ -l sv -o $@

.PHONY: clean
clean:
	rm -f ino/*
