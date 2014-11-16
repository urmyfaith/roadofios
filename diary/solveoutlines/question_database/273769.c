#include <stdio.h>
#include <stdlib.h>


struct 
{
	int n;
	char c;
}m;
int main()
{


	scanf("%d",&m.n);
	while((m.c=getchar())==' ' || (m.c=='\n') )
		;

	printf("%d %c",m.n,m.c);
	return 0;	
}
