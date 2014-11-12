#include <stdio.h>

#define NUM 5

void insert_num_into_array(int *p, int size,int pos,int n);

int main()
{
	int array[NUM]={};		
	int i;
	int insert_pos,insert_number;

	printf("input array[5]:\n");
	for ( i = 0; i < NUM; i++)
		scanf("%d",&array[i]);
#if 0
	for ( i = 0; i < NUM; i++)
		printf("%d",array[i]);
	printf("\n");
#endif

	printf("insert position:\n");
	scanf("%d",&insert_pos);

	printf("insert  number:\n");
	scanf("%d",&insert_number);

	insert_num_into_array(array,NUM,insert_pos,insert_number);

	for ( i = 0; i < NUM; i++)
		printf("%3d",array[i]);
	printf("\n");



	return 0;
}

// 插入数组，先元素后移，然后在插入位置插入元素
//  0 1 2 3 4 -- 下标
//  1 2 3 4 5
//  1 2   3 4 [5]
//  1 2 x 3 4
void insert_num_into_array(int *p, int size,int pos,int n) 
{ 
	int i;
	
	for ( i=size-1; i > pos-1 ; i--) //如果插入的位置是3，实际下标为2
	{
		p[i] = p[i-1];
	}
	p[i] = n;
	
}
