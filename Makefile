CC=g++
STD=-std=c++1z
CFLAGS=-Wall -g
PATHINCLUDE=./include/headers
PATHSRC=./src/
PATHOBJ=./obj/

OUTPUT=MyProg


SOURCES=$(shell find $(PATHSRC) -name *.cpp)

OBJECTS=$(patsubst $(PATHSRC)%.cpp,$(PATHOBJ)%.o,$(SOURCES))

COMPILE=$(CC) $(CFLAGS) $(STD)

all: $(OUTPUT)

$(OUTPUT): $(OBJECTS)  
	$(COMPILE) -o $@ $^

$(PATHOBJ)%.o: $(PATHSRC)%.cpp
	mkdir -p $(dir $@)
	$(COMPILE) -I$(PATHINCLUDE) -c $< -o $@

clean:
	rm -rf $(PATHOBJ)*
	rm $(OUTPUT)

.PHONY: all clean
