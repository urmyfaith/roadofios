// 100个元素的数组，查询是否有等于n的元素；

#include <stdio.h>

#define NUM 100


int main(void)
{
	int  array[NUM] = {};
	int i, n, flag = 0;
	
	scanf("%d",&n);

	for ( i = 0 ; i < NUM ; i++ )
	{
		array[i] = i + 1 ;
	}

	for ( i = 0 ; i < NUM ; i++ )
	{
		if( n ==  array[i] )
		{
			flag = 1;
			break;
		}
	}
	
	if( 1 == flag )
		printf("YES");
	else
		printf("NO");

	return 0;
}
