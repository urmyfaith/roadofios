#include <stdio.h>

#define NUM 1024


int main(void)
{
	char array[NUM] = {};
	int i = 0;
	int count_char = 0,count_number = 0,count_symbol = 0;
	float sum = 0;

	//输入一串字符，保存，添加尾0
	while( '\n' != (array[i] = getchar()))
		i++;
	array[i]='\0';

	
	for( i = 0; array[i]!='\0'; i++ )
	{
		if( array[i] >= '0' && array[i] <= '9' )
			count_number += 1;
		if( (array[i] >= 'a'&& array[i] <= 'z') || 
				( array[i] >= 'A' && array[i] <='Z' ) ) 
			count_char += 1;
		switch(array[i])
		{
			case ',':
			case '.':
			case '?':
			case ':':
			case '!':
			case ';':
				count_symbol += 1;
				break;
			default:
				break;
		}
	}
//	printf("count_char = %d\n",count_char);
//	printf("count_number= %d\n",count_number);
//	printf("count_symbol= %d\n",count_symbol);
	printf("%.1f\n",count_char*1.0 + count_number*0.5 + count_symbol*0.8);

	return 0;
}
