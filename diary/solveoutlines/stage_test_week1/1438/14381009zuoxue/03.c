# include <stdio.h>

int main()
{
	int i,j;
	
	for ( i = 0 ; i < 6; i++ ) //输出行数为6
	{
		for ( j = 0; j< 6 - i; j++ ) // 输出列数，列数位 6 ，5 ，4 .。1
		{
			printf("%c",'F' - (6-i) + j + 1 );
		}
			
		printf("\n");	
	}

	return 0;
}
