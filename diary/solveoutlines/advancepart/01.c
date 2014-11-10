#include <stdio.h>


void print_star(int n);


int main(void)
{
	int num = 3;
	//scanf("%d",&num);
	
	print_star(num);

	return 0 ;
}

void print_star(int n)
{
	int row,col;

	for (row = 0;row < n ; row++ ) //控制行 3行
	{
		for ( col = 0; col < n + row ; col++ )
		{
			if ( col < n -row - 1 )
				printf(" ");
			else
				printf("*");
		}
		printf("\n");
	}
}
