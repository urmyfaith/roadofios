#include <stdio.h>

#define NUM 10


int main(void)
{
	int  array[NUM] = {};
	int i,sum = 0 ;

	//先输入的数字，保存在后面的下标。
	for( i = NUM-1; i> -1; i-- )
	{
		scanf("%d",&array[i]);
	}
	

	//输出数组。
	for( i = 0; i < NUM; i ++)
	{
		//printf("array[%d]=%d\n",i,array[i]);
		if( 0 == array[i]%3 )
			sum +=  array[i];
	}
	printf("%d",sum);
	return 0;
}
