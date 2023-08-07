#include <stdio.h> // comment outside main.
void dummy(){return;}
int main()
{
	// comment in main.
	dummy();
	char str[]="#include<stdio.h> // comment outside main.%1$cvoid dummy(){return;}%1$cint main()%1$c{%1$c	// comment in main.%1$c	dummy();%1$c	char str[]=%2$c%3$s%2$c;%1$c	printf(str, 10, 34, str);%1$c}%1$c";
	printf(str, 10, 34, str);
}
