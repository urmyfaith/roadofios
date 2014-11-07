#include <stdio.h>

#define NUM 1024
int main()
{
	char array[NUM]={};
	int i = 0,count = 0;

	while( '\n' != (array[i]=getchar()) )
	{
		i++;
	}
	array[i] = '\0';

	i = 0;
	for( i = 0 ; '\0' != array[i] ; i++ )
	{
		if( ' ' == array[i] )
			count += 1;
	}
	count += 1;

	printf("%d",count);

	return 0;
}
