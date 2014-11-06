// 数组中第二大元素的下标
// 比较法：
// 1 2 3 40 5 6 7 8 9 10
// 第一次找出最大的下标
// 第二次，排除第一次的下标，依次比较。

#include <stdio.h>

#define NUM 10


int main(void)
{
	int  array[NUM] = {};
	int i, flagA = 0,flagB = 0;
	

	for ( i = 0 ; i < NUM ; i++ )
	{
		scanf("%d",&array[i]);
	}

	// 找出第一个大的元素：
	for ( i = 1 ; i < NUM ; i++ )
	{
		if( array[flagA] < array[i] )
			flagA = i;
	}

	// 除去第二大的元素，找出最大的元素；
	for ( i = 0 ; i < NUM ; i++ )
	{
		if( i!= flagA)
		{
			if( array[flagB] < array[i] )
				flagB= i;
		}
	}

	printf("%d",flagB);

	return 0;
}
