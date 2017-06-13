TARGET=helloworld
CC=gcc
CFLAGS=
RM=/bin/rm

all:helloworld.o
	$(CC) -o $(TARGET) $*

.PHONY:all clean

clean:
	$(RM) -f helloworld.o
	$(RM) -f $(TARGET)
