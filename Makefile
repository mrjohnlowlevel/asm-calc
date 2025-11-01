ASMC = nasm
NASMFLAG = -f elf64
SRC = src/main.asm
OBJ = obj/main.o
BIN = bin/calc

all: $(BIN)

$(BIN): $(OBJ)
	ld $^ -o $@

$(OBJ): $(SRC)
	$(ASMC) $(NASMFLAG) $^ -o $@

.PHONY: clean
clean:
	rm $(OBJ) $(BIN)
