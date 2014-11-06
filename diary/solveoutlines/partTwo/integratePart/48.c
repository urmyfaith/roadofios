// 数组中最大值的下标；
// 比较法：将后面的元素和第一个比较，如果后面的大，记录最大的就可以了。

#include <stdio.h>

#define NUM 10


int main(void)
{
	int  array[NUM] = {};
	int i,flag = 0;
	

	for ( i = 0 ; i < NUM ; i++ )
	{
		scanf("%d",&array[i]);
	}

	for ( i = 1 ; i < NUM ; i++ )
	{
		if( array[flag] < array[i] )
			flag = i;
	}

	printf("%d",flag);

	return 0;
}
