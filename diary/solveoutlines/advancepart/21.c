// 某个字符数组中ASCII码为偶数的字符删除，删除后形成一个新的数组；
//  意思就是找出所有ASCII位奇数的字符，形成一个新的数组；
//
#include <stdio.h>

#define NUM 1024

void delete_even_ascii_char_in_array(char *str);

int main()
{
	char str[NUM]={};

	int i=0;	
	while( (str[i++]=getchar()) != '\n')
		continue;
	str[i]='\0';
#if 0	
	for ( i = 0; '\0' != str[i] ; i++ )
	{
		putchar(str[i]);
	}
#endif

	delete_even_ascii_char_in_array(str);

	puts(str);

	return 0;
}

void delete_even_ascii_char_in_array(char *str)
{
	char new_str[NUM];
	char *p = new_str;
	int i;
	//取出奇数ascii插入数组
	for ( i = 0; '\0' != str[i]; i++)
	{
		if( 0 != str[i]%2 )
		{
			*p = str[i];
			p++;
		}
	}
	p[i] = '\0';

	//复制字符数组；
	p = new_str;
	while('\0' != *p)
	{
		*str = *p;
		p++;
		str++;
	}
	*str = '\0';

}

#if 0
0	48
9	57
A	65
Z	90
a	97
z	122
#endif

