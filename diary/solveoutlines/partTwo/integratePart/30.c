#include <stdio.h>

#define NUM 1024


int main(void)
{
	char array[NUM] = {};
	int i = 0;

	//输入一串字符，保存，添加尾0
	while( '\n' != (array[i] = getchar()))
		i++;
	array[i]='\0';

	
	for( i = 0; array[i]!='\0'; i++ )
	{
		switch(array[i])
		{
			case 'Z':
				array[i] = 'A';
				break;
			case 'z':
				array[i] = 'a';
				break;
			default:
				array[i] = array[i] + 1;
				break;
		}
	}
	
	puts(array);

	return 0;
}
