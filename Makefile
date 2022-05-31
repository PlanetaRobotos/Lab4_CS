CFLAGS= -f elf32
LFLAGS= -m elf_i386
one: one.o -o one
#    rm one.o           # Remove hello.o to force a recompile each time
#    ./one               # Execute hello
    
    
all:


one.o: one.asm
    as one.asm

clean:
    rm -f *.o