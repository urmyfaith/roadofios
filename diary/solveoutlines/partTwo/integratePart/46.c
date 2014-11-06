//10元素数组，第二个元素删除，后面的元素左移；
//	i  	  0 1 2 3 4 5 6 7 8 9 
//	a[i]  1 2 3 4 5 6 7 8 9 10
//		  1 3 4 5 6 7 8 9 10 
//		  思路：

#include <stdio.h>

#define NUM 10


int main(void)
{
	int  array[NUM] = {1,2,3,4,5,6,7,8,9,10};
	int i ;

	for ( i = 1 ; i < NUM - 1 ; i++ )
	{
		array[i] = array[i+1];
//		a[1] = a[2];
	}
	array[NUM-1] = 0 ;

	

	//输出数组。
	for( i = 0; i < NUM; i ++)
	{
		printf("array[%d]=%d\n",i,array[i]);
	}
	return 0;
}
