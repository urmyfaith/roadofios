/*7.根据传入参数，打印对应图形(20分)
 * printGraphic("12345");
 * 打印:
 * 123454321
 *  2     2
 *    3   3
 *       4 4
 *           5
 *           */

#include <stdio.h>
#include <string.h>

#define LEN 10

void printGraphic(const char *str);

int main(void)
{
	char str[LEN]="123456";

	printGraphic(str);

	return 0;
}
void printGraphic(const char *str)
{
	int len = (int) strlen(str);
	int row,col;

	for( row =0; row <len; row++ )
	{
		for (col =0; col <len*2-1; col++)
		{
			if(row==0) //输出第一行
			{
				if(col<len)
					putchar(str[col]); //输出前半部分
				else
					putchar(str[2*len-2-col]); //输出后半部分
			}
			else
			{
				if(col==row || col == len*2-2-row) //输出特殊位置
					putchar(str[row]);
				else
					putchar(' ');
			}
		}
		putchar('\n');
	}
}
