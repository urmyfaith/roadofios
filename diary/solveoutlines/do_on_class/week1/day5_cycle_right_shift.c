//  {1,2,3,4,5,6,7,8,9,10};
//	   1 2 3 4 5 6 7 8 9  10
//   0 1 2 3 4 5 6 7 8 9 
//



#include  <stdio.h>
#define NUM 10

int main(void)
{
	int array[NUM] = {1,2,3,4,5,6,7,8,9,10};
	int temp ;
	int i ;

	for ( i = 0; i< NUM ; i++ )
	{
		printf("%d ",array[i]);
	}
	printf("\n");

	//shift one.
	temp = array[NUM-1];
	for ( i = NUM-1 ; i >0  ; i-- )
	{
		array[i] = array[i-1];
	}
	array[0] = temp;
		
	for ( i = 0; i< NUM ; i++ )
	{
		printf("%d ",array[i]);
	}
	printf("\n");
	return 0;
}
