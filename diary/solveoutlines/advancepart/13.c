#include <stdio.h>

void reverse_array( int *p,int size)
{
	//数组array
	int i;
	int temp;

	for ( i = 0; i <= size/2 ;i++)
	{
		temp = p[i];
		p[i] =  p[size-1 -i];
		p[size-1 -i] = temp;
		
	}
	return ;
}

#define NUM 5

int main()
{
	int *p = NULL;
	int array[NUM] = {1,2,3,4,5};
	int i;

	for ( i = 0; i < NUM; i++ )
	{
		printf("%3d",array[i]);
	}
	printf("\n");

	reverse_array(array,NUM);
	for ( i = 0; i < NUM; i++ )
	{
		printf("%3d",array[i]);
	}
	printf("\n");
	return 0;
}
