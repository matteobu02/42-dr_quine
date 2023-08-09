#include <stdio.h>
#include <fcntl.h>
/*
	This program will print its own source when run.
*/
#define CHILD "Grace_kid.c"
#define CODE(x) int x(){int fd = creat(CHILD, 0600); char str[]="#include <stdio.h>%1$c#include <fcntl.h>%1$c/*%1$c	This program will print its own source when run.%1$c*/%1$c#define CHILD %2$cGrace_kid.c%2$c%1$c#define CODE(x) int x(){int fd = creat(CHILD, 0600); char str[]=%2$c%3$s%2$c; dprintf(fd, str, 10, 34, str); return 0;}%1$c#define MAIN main%1$c%1$cCODE(MAIN)%1$c"; dprintf(fd, str, 10, 34, str); return 0;}
#define MAIN main

CODE(MAIN)
