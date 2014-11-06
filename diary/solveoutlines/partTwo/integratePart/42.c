//判断数组是否是对称数组； 
// array={1,2,3,3,2,1}

#include <stdio.h>

#define NUM 6


int main(void)
{
	int  array[NUM] = {};
	int  i,flag = 1 ;

	for( i = 0; i < NUM ; i++ )
	{
		scanf("%d",&array[i]);
	}
	

	for( i = 0; i < NUM/2; i++)
	{
		if( array[i] != array[NUM-1-i] )
		{
			flag = 0;
			break;
		}
	}
	
	if( 1 == flag )
	{
		printf("YES");
	}
	else
		printf("NO");


	return 0;
}

/*
 *  思路：首位对比即可。
 */

