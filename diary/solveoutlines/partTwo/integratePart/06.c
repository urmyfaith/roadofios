#include <stdio.h>

int main()
{
	int i,j;
	int lineCount,numCount;

	lineCount = 5;
	

	//output 5 line.
	for(i=1;i<=lineCount;i++)
	{
		numCount = i;
		//output each line char
		for(j=1;j<=numCount;j++)
		{
			printf("%c",64+j);
		}
		printf("\n");
	}
	return 0;
}

/*
 * A --65
 * Z --90
 * */
