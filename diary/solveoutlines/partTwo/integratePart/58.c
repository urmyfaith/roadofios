#include <stdio.h>

#define N 10

int main(void)
{
	int array[N] = {1,2,3,4,5,6,7,8,9,10};
	int i ;
	int flag = 1,max ,sum_array_3_number = 0;

	max = array[0] + array[1] + array[2];
	//for ( i = 0 ; i < NUM ; i++)
	for ( i = 0 + 1; i < N - 1 ; i++)
	{
		sum_array_3_number = (array[i-1] + array[i] + array[i+1]);
		if ( sum_array_3_number > max)
			flag = i ;
	}
	// printf("%d\n",flag);

	printf("%d %d %d\n",array[flag-1],array[flag],array[flag+1]);
	
}
