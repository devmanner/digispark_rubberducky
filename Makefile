DUCKFILES = $(wildcard duck/*.duck)
INOFILES = $(subst duck,ino,$(DUCKFILES:.duck=.ino))

all: ${INOFILES}

ino/%.ino: bin/%.bin
	python ~/repos/duck2spark/duck2spark.py -i $^ -l 1 -f 1000 -o $@

bin/%.bin: duck/%.duck
	python ~/repos/duckencoder.py/duckencoder.py -i $^ -l sv -o $@

.PHONY: clean
clean:
	rm -f ino/*
