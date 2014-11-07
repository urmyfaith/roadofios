#include <stdio.h>

int main(void)
{
	int n,row,col;
	scanf("%d",&n);

	//外层循环：行，共计4行；
	for ( row = 0; row < n ; row++ )
	{
		//内层循环，输出一行的每一列；
		for ( col = 0; col < n + row  ; col++)
		{
			if ( col < n-1-row )
				putchar(' ');
			else
				putchar('*');
					
		}
		printf("\n");
	}
	
	return 0;
}
