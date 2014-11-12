#include <stdio.h>

#define NUM 10

int main()
{
	int array[NUM]={1,2,3,4,5,6,7,8,9,10};

	int i,j,temp;

	for ( i = 1 ;i < NUM; i++)
	{
		temp = array[i];
		for ( j = i - 1; j>=0 ;j--)
		{
			if(array[j]<temp)
			{
				array[j+1]=array[j];
			}
			else
				break;
		}
		array[j+1] = temp;
	}

	for ( i = 0; i < NUM; i++)
	{
		printf("%d ",array[i]);
	}
	printf("\n");


	return 0;
}

#if 0
把第一个当成一个有序数组，
把当前数插入到有序数组中。
				1	2	3	4	5	6	7	8	9	10
			   [1]	2	3	4	5	6	7	8	9	10
第一趟			
#endif

