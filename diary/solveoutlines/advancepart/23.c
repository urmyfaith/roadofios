#include <stdio.h>

#define  NUM 10

void right_shift_str( char *p ,int n);

int main()
{
	char str[NUM]="abcdefhij";    //字符数组，9个元素+‘\0’;
	int shift_digit = 0;

	printf("please input the number to right shift the str.\"abcdefhij\"\n");
	scanf("%d",&shift_digit);

	right_shift_str(str,shift_digit);

	puts(str);
	return 0;
}
void right_shift_str( char *p ,int n)
{
	int i ,j;
	int length_of_str = 0;
	char *q = p;
	char temp;

	//计算有效的字符长度。
	while( '\0' != *q )
	{
		length_of_str++;
		q++;
	}

	for( j = 0; j < n; j++ )
	{
		//右移1位.
		temp = *(p + (length_of_str - 1) );
		for ( i = length_of_str-1 ; i > 0 ; i-- ) //p[1]=p[0;
		{
			p[i] =p[i-1];
		}
		p[0] = temp;
	}
}

//先写右移动1位
//然后包裹一层循环
// a b c d e f  \0
//   a b c d e  
