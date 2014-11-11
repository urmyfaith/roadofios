#include <stdio.h>

#define NUM 50

void insert_into_a_sorted_array(int *p,int size,int num);

int main()
{
	int array[NUM] = {1,3,5,7,9,11,13};
	int num = 6;
	int i;
	
	insert_into_a_sorted_array(array,NUM,num);
	
	for ( i = 0; array[i] != 0; i++ )
	{
		printf("%d\t",array[i]);
	}
	return 0;
}

void insert_into_a_sorted_array(int *p,int size,int num)
{
	int i;
	int insert_flag,zero_flag;

	// 记录插入下标
	for ( i = 0; p[i] !=0 ; i++)
	{
		if ( p[i] > num)
		{
			insert_flag = i;
			break;
		}
	}

	//记录元素为0的下标
	for( i = 0; i < NUM; i++ )
	{
		if(p[i]==0)
		{
			zero_flag = i;	
			break;
		}
	}

	//   1  3  5  7  9
	//   0  1  2  3  4
	//			  i			insert_flag = 3
	//				   z	zero_falg = 5
	//插入位置的元素后移，插入元素。
	//			p[4]=p[3]  结束时候
	for ( i = zero_flag; i > insert_flag; i-- )
	{
		p[i] = p[i-1];
	}
	p[i] = num; //p[insert_flag=num];

}
	
