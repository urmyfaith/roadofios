// 交换两个数组的内容；
// a[]= {1,2,3},b[]={4,5,6};
//

#include <stdio.h>

#define NUM 4


int main(void)
{
	int  arrayA[NUM] = {};
	int  arrayB[NUM] = {};
	int  i,temp;

	printf("input arrayA: a b c d\n");
	for( i = 0; i < NUM ; i++ )
	{
		scanf("%d",&arrayA[i]);
	}

	printf("input arrayB: a b c d\n");
	for( i = 0; i < NUM ; i++ )
	{
		scanf("%d",&arrayB[i]);
	}
	

	for( i = 0; i < NUM; i++)
	{
		temp = arrayA[i];
		arrayA[i] = arrayB[i];
		arrayB[i] = temp;
	}

	printf("\nafter switch,arrayA:\n");
	for( i = 0; i < NUM ; i++ )
	{
		printf("%d ",arrayA[i]);
	}

	printf("\nafter switch,arrayB:\n");
	for( i = 0; i < NUM ; i++ )
	{
		printf("%d ",arrayB[i]);
	}
	return 0;
}

/*
 *  思路：首位对比即可。
 */

