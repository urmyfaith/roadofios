// 统计某个整数在数组中出现的次数； 

#include <stdio.h>

#define NUM 6


int main(void)
{
	int  array[NUM] = {};
	int i,count = 0,num;
	
	printf("intput array, a[6]\n");
	for ( i = 0 ; i < NUM ; i++ )
	{
		scanf("%d",&array[i]);
	}

	printf("input number to count in array ,\n");
	scanf("%d",&num);

	for ( i = 1 ; i < NUM ; i++ )
	{
		if ( num == array[i] )
			count += 1;
	}

	printf("%d ",count);
	return 0;
}
