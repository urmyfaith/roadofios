// 数组中小于10的元素个数

#include <stdio.h>

#define NUM 10


int main(void)
{
	int  array[NUM] = {};
	int i, count = 0;
	

	for ( i = 0 ; i < NUM ; i++ )
	{
		scanf("%d",&array[i]);
	}

	for ( i = 0 ; i < NUM ; i++ )
	{
		if( array[i] < 10)
			count += 1;
	}

	printf("%d",count);

	return 0;
}
