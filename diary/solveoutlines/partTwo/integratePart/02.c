#include <stdio.h>

int main()
{
	int i,j;
	int lineCount=0;
	int starCount=0;

	lineCount=10;
	starCount=5;
	for(i=0;i<lineCount;i++)
	{
		for(j=0;j<starCount;j++)
		{
			printf("*");
		}
		printf("\n");
	}
	return 0;
}
