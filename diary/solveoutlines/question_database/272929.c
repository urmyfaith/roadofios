#include <stdio.h>

int main()
{
	int num,row,col;
	scanf("%d",&num);
	
	for(row = 1; row <= num; row++)
	{
		for(col = 1;col <= row ;col++)
		{
			printf("A");
		}
		printf("\n");
	}

	return 0;
}
