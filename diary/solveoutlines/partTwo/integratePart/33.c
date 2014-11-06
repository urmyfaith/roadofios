#include <stdio.h>

#define NUM 1024


int main(void)
{
	int  array[NUM] = {1,2,3,4};
	int i = 0, sum = 0;

	for( i = 0; i < 4; i++ )
	{
		if( array[i]%2 ==0)
		{
			sum += array[i];
		}
	}
	printf("%d",sum);
	return 0;
}
