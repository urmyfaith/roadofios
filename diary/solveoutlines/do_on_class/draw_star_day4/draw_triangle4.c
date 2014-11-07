#include <stdio.h>

int main(void)
{
	int n,row,col;
	scanf("%d",&n);

	//外层循环：行，共计4行；
	for ( row = 0; row < n ; row++ )
	{
		//内层循环，输出一行的每一列；
		for ( col = 1; col < n + row - 1 ; col++)
		{
			if ( col < n-row )
				putchar(' ');
			else
				putchar('*');
					
		}
		printf("\n");
	}
	
	return 0;
}
