#include <stdio.h>

#define NUM 10

int secondMax(const int *arr,int len);

int main()
{
	int array[NUM]={};
	int second_max;
	int i;

	printf("input 10 numbers:\n");
	for ( i = 0; i < NUM; i++ )
	{
		printf("\narray[%d]=",i);
		scanf("%d",&array[i]);
	}

	second_max = secondMax(array,NUM);

	printf("\nsecondMax is %d\n",second_max);
	
	return 0;
}
int secondMax(const int *arr,int len)
{
	int i;
	int max_flag,second_flag;
	
	max_flag = 0;
	for ( i = 0; i < len; i++ )
	{
		max_flag = arr[max_flag] > arr[i] ? max_flag : i;
	}
	second_flag = 0;
	for ( i = 0; i < len; i++ )
	{
		if(i!=max_flag)
		{
			second_flag = arr[second_flag] > arr[i] ? second_flag : i;
		}
	}

	return arr[second_flag];
}
