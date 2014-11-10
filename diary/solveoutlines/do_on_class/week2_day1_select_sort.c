#include <stdio.h>

#define NUM 10

int main()
{
	int array[NUM] = {1,2,3,4,5,6,7,8,9,10};
	
	int i,j,temp,flag;

	for ( i = 0; i < NUM;i++)
	{
		printf("%d\t",array[i]);
	}
	printf("\n");

	for (i = 0; i < NUM-1; i++ )
	{
		flag = i;
		for ( j = i+1; j < NUM ; j++ )
		{
			if(array[flag] < array[j])
				flag = j;

		}
		if( flag != i)
		{
			temp = array[i];
			array[i] = array[flag];
			array[flag]= temp;
		}
	}
	for ( i = 0; i < NUM;i++)
	{
		printf("%d\t",array[i]);
	}
	printf("\n");
	return 0;
}
