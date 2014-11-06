// 数组中大于平均数的元素的个数；

#include <stdio.h>

#define NUM 10


int main(void)
{
	float  array[NUM] = {};
	int i, count = 0;
	float average = 0, sum = 0;
	

	for ( i = 0 ; i < NUM ; i++ )
	{
		scanf("%f",&array[i]);
	}

	for ( i = 0 ; i < NUM ; i++ )
	{
		sum = sum + array[i];
	}
	average = sum /NUM;

	for ( i = 0 ; i < NUM ; i++ )
	{
		if( array[i] > average)
			count += 1;
	}


	printf("%d",count);

	return 0;
}
