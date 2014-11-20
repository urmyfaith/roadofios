////7.实现函数，根据输入的内容打印图形(10) 
//void printString(const char * str);
////比如:printString("1234567");
////打印:
///*
//1234567
// 2   6
//   3 5
//      4
//        3 5
//         2   6
//         1234567
//         */
#include <stdio.h>
#include <string.h>
#define LEN 100

void printString(const char *str);

int main(void)
{
	int i=0;
	char array[LEN];

	while ( ( array[i] = getchar() ) != '\n' )
		i++;
	array[i] ='\0';

	printString(array);
	return 0;
}
void printString(const char *str)
{
	int i,j;
	int len = (int) strlen(str);
	for ( i = 0; i < len; i++ ) // 7 rows
	{
		for ( j = 0; j < len;  j++ )
		{
			if( j== i || j == len -1 -i)
			{
				if(j==i)
					putchar(str[i]);
				else 
				{
					if(j==len-1-i )
						putchar(str[len-1-i]);
				}
			}
			else
			{
				if( i == 0 || i == len-1)
					putchar(str[j]);
				else
					putchar(' ');
			}
		}
		putchar('\n');
	}
}


