#include <stdio.h>

#define NUM 10

int main(void)
{
	int array[NUM]={};
	int i;
	int temp;

	for ( i = 0; i < NUM; i++ )
	{
		scanf("%d", &array[i]);
	}
	
	for ( i = 0; i< NUM/2; i++ )
	{
		temp =  array[i];
		array[i] = array[NUM-i-1];
		array[NUM-i-1] = temp;
	}

	for ( i = 0; i < NUM; i++ )
	{
		printf("%d ",array[i]);
	}
	printf("\n");
	

	return 0;
}
