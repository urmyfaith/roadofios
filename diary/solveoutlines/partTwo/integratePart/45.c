//10元素数组，第五个元素位置插入88，其他顺后延。
//	i  	  0 1 2 3 4 5 6 7 8 9 
//	a[i]  1 2 3 4 5 6 7 8 9
//		  1 2 3 4   5 6 7 8 9
//		  思路：先后移元素，然后插入，最后输出数组。

#include <stdio.h>

#define NUM 10


int main(void)
{
	int  array[NUM] = {1,2,3,4,5,6,7,8,9};
	int i ;

	for ( i = NUM -1 ; i > 4 ; i-- )
	{
		array[i] = array[i-1];
//		a[5] = a[4];
	}
	array[4] = 88 ;

	

	//输出数组。
	for( i = 0; i < NUM; i ++)
	{
		printf("array[%d]=%d\n",i,array[i]);
	}
	return 0;
}
