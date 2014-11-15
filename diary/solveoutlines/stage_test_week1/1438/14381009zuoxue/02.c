#include <stdio.h>

int main()
{
	char ch;
	int i,row,col;
	char a = 'A';
	
	scanf("%c",&ch);

	row = ch - 'A' + 1; // F-->6 ,A-->1;

	for ( i = 0; i < row ; i ++ ) //输出多少行；
	{
		for ( col = 0; col < row*2 - 1 ; col++ ) //输出列；
		{
			if ( col < row )
				printf("%c", ch + col - row + 1);
			else
				printf("%c", ch - col + row - 1);
		
		}
		printf("\n");
		
	}


	return 0;
}
