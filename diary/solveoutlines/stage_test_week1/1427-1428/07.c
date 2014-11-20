#include <stdio.h>
#include <string.h>
#define LEN 100
void printString(const char *str);

int main(void)
{
	char str[LEN]={};
	int i=0;
	while ( (str[i]=getchar()) != '\n' )
	{
		i++;
	}
	str[i] = '\0';
	//puts(str);

	printString(str);

	return 0;
}
void printString(const char *str)
{
	int i,j;
	int length = (int)strlen(str);
	for ( i = 0; i < length/2 + 1; i++ )  //控制行数 7行 4行
	{
		for ( j = 0; j < length; j++ ) //控制列数 7列
		{
			if( j < i)
				putchar(' ');
			else
			{
				if( j == i )
					putchar(str[i]);
				else
				{
					if( j< length -1 -i)
					{
						if( i ==0 )
							putchar(str[j]);
						else
							putchar(' ');
					}
					else
					{
						if(j==length-1-i)
							putchar(str[length-1-i]);
						else
							putchar(' ');
					}
				}
			}
		}
		putchar('\n');
	}
	for ( i = length/2 -1; i >= 0; i-- )  //控制行数 7行 4行
	{
		for ( j = 0; j < length; j++ ) //控制列数 7列
		{
			if( j < i)
				putchar(' ');
			else
			{
				if( j == i )
					putchar(str[i]);
				else
				{
					if( j< length -1 -i)
					{
						if( i ==0 )
							putchar(str[j]);
						else
							putchar(' ');
					}
					else
					{
						if(j==length-1-i)
							putchar(str[length-1-i]);
						else
							putchar(' ');
					}
				}
			}
		}
		putchar('\n');
	}
}
