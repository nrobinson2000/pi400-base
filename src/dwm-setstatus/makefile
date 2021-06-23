CC=gcc
RM=rm -f

FLAGS=-lX11
SRC=$(shell find *.c)
BIN=$(SRC:%.c=%)

PREFIX=/usr/local

all: $(BIN)

%: %.c
	$(CC) $^ $(FLAGS) -o $@

install: $(BIN)
	cp $(BIN) $(PREFIX)/bin

clean:
	$(RM) $(BIN)
