#include <stdio.h>
#include <stdlib.h>


struct 
{
	int n;
	char c;
}m[3];

int main()
{

	int i;
	for( i = 0; i < 3; i++)
	{
		scanf("%d",&m[i].n);
		while((m[i].c=getchar())==' ' || (m[i].c=='\n') )
			;
	}
	for( i = 0; i< 3; i++)
	{
		printf("%d %c\n",m[i].n,m[i].c);
	}

	return 0;	
}
