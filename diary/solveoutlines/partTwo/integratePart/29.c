#include <stdio.h>

#define NUM 1024


int main(void)
{
	char array[NUM] = "abcDEFhijKMN";
	int i;

	for( i = 0; array[i]!='\0'; i++ )
	{
		if( i%2==0 )	//下标位偶数
		{
			if( array[i]>='a' && array[i] <= 'z' )	//如果是小写转为大写。
				array[i] = array[i] - 32;
		}
	}
	
	puts(array);

	return 0;
}
