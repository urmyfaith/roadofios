#include <stdio.h>

#define NUM 5


int main(void)
{
	int  array[NUM] = {1,2,3,4,5};
	int temp;

	for(int i = 0; i < NUM; i++)
	{
		printf("array[%d]=%d\n",i,array[i]);
	}

	temp = array[0];
	array[0] = array[NUM-1] ;
	array[NUM-1] = temp;

	printf("\nafter switch:\n");

	for(int i = 0; i < NUM; i++)
	{
		printf("array[%d]=%d\n",i,array[i]);
	}

	return 0;
}
