#include <stdio.h>

int main()
{
	int i,j,k;
	int lineCount;

	lineCount = 5;

	for(i=lineCount;i>0;i--)
	{
		for(j=1;j<=i;j++)
		{
			printf("%d",j);
		}
		printf("\n");
	}
	return 0;
}
