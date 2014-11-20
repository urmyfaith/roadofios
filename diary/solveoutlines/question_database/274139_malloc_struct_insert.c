#include <stdio.h>
#include <stdlib.h>

#define NUM 8

struct N
{
	int no;
};

int main(void)
{
	struct N arr[NUM];
	int i;
	int insert_num;
	int insert_pos;

	//-1 0 1 2 3 7 9 5
	// 8个数子
	for ( i = 0; i < NUM-1; i++ )
	{
		scanf("%d",&arr[i].no);
	}
	scanf("%d",&insert_num);
	
	//找到第一个比它大的数，
	//从这个数开始，后面的数，后移
	//插入这个数；
	for (i = 0; i < NUM - 1; i++ )
	{
		if(arr[i].no > insert_num )
		{
			insert_pos = i;
			break;
		}
	}
	for (i = NUM - 1; i > insert_pos; i-- )
	{
		arr[i].no = arr[i-1].no;
	}
	arr[insert_pos].no = insert_num;

	for (i = 0; i < NUM; i++ )
	{
		printf("%d ",arr[i].no);
	}
	
}
