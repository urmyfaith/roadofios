#include <stdio.h>

#define NUM 1024
int main()
{
	char array[NUM]={};
	int i = 0;

	while( '\n' != (array[i]=getchar()) )
	{
		i++;
	}

	i = 0;
	while( ' ' != array[i] )
	{
		i++;
	}
	printf("%d",i+1);

	return 0;
}
