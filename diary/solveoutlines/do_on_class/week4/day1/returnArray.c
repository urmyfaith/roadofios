#include <stdio.h>
#include <stdlib.h>
#include <string.h>


char ** getActors(void);

int main(void)
{

	char **q =(char **) malloc(sizeof(char *)* 20);
	q = getActors();
	puts(q[1]);
	puts(q[2]);

	return 0;
}

char ** getActors(void)
{
	char **p=(char **) malloc(sizeof(char *)* 20);
	p[1]="hello";
	p[2]="world";

	return p;
}
