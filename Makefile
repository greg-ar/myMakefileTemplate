CC=g++
STD=-std=c++1z
CFLAGS=-Wall -g

PATHINCLUDE=./include/headers
PATHSRC=./src/
PATHOBJ=./obj/

SRCSUFFIX=.cpp

OUTPUT=MyProg


SOURCES=$(shell find $(PATHSRC) -name *$(SRCSUFFIX))

OBJECTS=$(patsubst $(PATHSRC)%$(SRCSUFFIX),$(PATHOBJ)%.o,$(SOURCES))

COMPILE=$(CC) $(CFLAGS) $(STD)

all: $(OUTPUT)

$(OUTPUT): $(OBJECTS)  
	$(COMPILE) -o $@ $^

$(PATHOBJ)%.o: $(PATHSRC)%$(SRCSUFFIX)
	mkdir -p $(dir $@)
	$(COMPILE) -I$(PATHINCLUDE) -c $< -o $@

clean:
	rm -rf $(PATHOBJ)*
	rm $(OUTPUT)

.PHONY: all clean
