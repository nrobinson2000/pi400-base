CC=pandoc
RM=rm -f

FLAGS=-t beamer
SRC=$(shell find *.md)
BIN=$(SRC:%.md=%.pdf)

all: $(BIN)

%.pdf: %.md
	$(CC) $^ $(FLAGS) -o $@

clean:
	$(RM) $(BIN)
