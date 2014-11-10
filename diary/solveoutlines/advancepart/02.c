#include <stdio.h>

void print_matrix(int n);

int main()
{
	int num = 5;
	//scanf("%d",&num);
	//
	print_matrix(num);
	
	return 0;
}

void print_matrix(int n)
{
	int row,col;

	for (row = 0 ; row < n ; row++)
	{
		for (col = 0; col < n ; col++)
		{
			if(col < row)
				printf("-1\t");
			else
				if(col > row )
					printf("1\t");
				else
					printf("0\t");

		}
		printf("\n");
	}

	return;
}
