#include <stdio.h>

#define NUM 10


int main(void)
{
	int  array[NUM] = {};
	int i = 0;

	for( i = 0; i < NUM; i++ )
	{
		if( i%3 ==0)
		{
			array[i] = 1;
			continue;
		}
		if( i%5 ==0)
		{
			array[i] = 2;
			continue;
		}
		if( i%7 ==0)
		{
			array[i] = 3;
			continue;
		}
		if(		( i%3 ==0 && i%5==0) ||
				( i%3 ==0 && i%7==0) ||
				( i%5 ==0 && i%7==0) ||
				( i%5 ==0 && i%7==0 && i%3==0) )
		{
			array[i] = 8;
			continue;
		}
		array[i]  = 0;
	}
	for ( i = 0; i < NUM; i++)
	{
		printf("a[%d]=%d\n",i,array[i]);
	}
	return 0;
}
