// 找出最小的元素，最小的元素放在首位值；
// 原来的首位放到最小元素的位置；
//  a[] = {5,4,3,2,1,7}
//=>a[] = {1,4,3,2,5,7}

#include <stdio.h>

#define NUM 6


int main(void)
{
	int  array[NUM] = {};
	int i,min_flag = 0,temp;	

	for ( i = 0 ; i < NUM ; i++ )
	{
		scanf("%d",&array[i]);
	}

	for ( i = 1 ; i < NUM ; i++ )
	{
		if ( array[min_flag] > array[i])
		{
			min_flag = i;
		}
	}

	temp = array[0];
	array[0] = array[min_flag];
	array[min_flag] = temp;

	for ( i = 0 ; i < NUM ; i++ )
	{
		printf("%d ",array[i]);
	}
	printf("\n");
	return 0;
}
