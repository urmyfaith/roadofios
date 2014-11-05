#include <stdio.h>

int main()
{
	int i,j;
	int lineCount=0;
	int starCount=0;

	lineCount=10;
	for(i=1;i<=lineCount;i++)
	{
		starCount = i;
		for(j=1;j<=starCount;j++)
		{
			printf("*");
		}
		printf("\n");
	}
	return 0;
}
