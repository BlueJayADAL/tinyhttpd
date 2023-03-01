all: httpd

httpd: httpd.o
	gcc httpd.o -L /usr/lib/happycoders/ -lsocket -lpthread -o httpd

httpd.o: httpd.c
	gcc -Wall -g -c httpd.c

clean:
	rm -f *.o httpd
