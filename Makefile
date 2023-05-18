CC=fpc
CFLAGS=-Twin32
F=dos

all: clear compile

clear:
	del $(F).exe $(F).o
	
compile:
	$(CC) $(CFLAGS) $(F).pas
