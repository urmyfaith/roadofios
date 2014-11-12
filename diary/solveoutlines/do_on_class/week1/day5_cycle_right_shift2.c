//  {1,2,3,4,5,6,7,8,9,10};
//	   1 2 3 4 5 6 7 8 9  10
//   0 1 2 3 4 5 6 7 8 9	下标
//

// 循环右移动1位： 保存最后一位，循环右移，恢复第一位；

// 循环右移N位 = N次循环1次。


#include  <stdio.h>
#define NUM 10

int main(void)
{
	int array[NUM] = {1,2,3,4,5,6,7,8,9,10};
	int temp ;
	int i,j,n ;
	
	scanf("%d",&n);

	for ( i = 0; i< NUM ; i++ )
	{
		printf("%d ",array[i]);
	}
	printf("\n");


	//shift N times;
	for ( j = 0 ; j < n ; j++)
	{
		//shift one.
		temp = array[NUM-1];
		for ( i = NUM-1 ; i >0  ; i-- )
		{
			array[i] = array[i-1];
		}
		array[0] = temp;
	}	


	for ( i = 0; i< NUM ; i++ )
	{
		printf("%d ",array[i]);
	}
	printf("\n");
	return 0;
}
