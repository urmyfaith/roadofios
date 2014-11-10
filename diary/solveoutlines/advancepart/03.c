#include <stdio.h>

void print_diamond(int n);

int main()
{
	int  num = 3 ;
	
//	scanf("%d",&num);
	
	print_diamond(num);

	return  0;
}

void print_diamond(int n)
{
	int row,col;
	for (row = 0; row < n; row++ )
	{
		for (col = 0; col < row + n ; col++)
		{
			if ( col < n - row - 1 )
				printf(" ");
			else
				printf("*");
		}
		printf("\n");
	}
	for (row = n-2; row >= 0 ; row-- )
	{
		for (col = 0; col < row + n ; col++)
		{
			if ( col < n - row - 1 )
				printf(" ");
			else
				printf("*");
		}
		printf("\n");
	}
}
