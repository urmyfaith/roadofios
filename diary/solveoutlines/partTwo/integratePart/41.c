// 将数组的前五个元素和数组的后五个元素交换。

#include <stdio.h>

#define NUM 10


int main(void)
{
	int  array[NUM] = {1,2,3,4,5,6,7,8,9,10};
	int  i,temp ;

	for( i = 0; i < NUM; i++)
	{
		printf("array[%d]=%d\n",i,array[i]);
	}


	for( i = 0; i < NUM/2; i++)
	{
		temp = array [i];
		array[i] = array[NUM/2+i];
		array[NUM/2+i] = temp;
		
	}


	printf("\nafter shift:\n");
	for( i = 0; i < NUM; i++)
	{
		printf("array[%d]=%d\n",i,array[i]);
	}
	

	return 0;
}

/*
 *  思路：循环交换1<-->6,2<--7>,...,5<--10>
 */

