#include <stdio.h>

#define NUM 1024
int main()
{
	char array[NUM]={};
	int i = 0,count = 0;
	char *p = NULL;
	
	//接受一行数据；
	while( '\n' != (array[i]=getchar()) )
	{
		i++;
	}
	array[i] = '\0';

	//对每个元素判断，如果是空格，那么计数。指针向后偏移，直至最后的'\0'
	p = array;
	while('\0'!= *p )
	{
		if ( ' ' == *p )
		{
			count += 1;
		}
		p++;
	}
	
	count += 1;

	printf("%d words in sentence.\n",count);

	return 0;
}
