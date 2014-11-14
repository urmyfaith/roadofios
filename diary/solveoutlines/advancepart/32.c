#include <stdio.h>

#define NUM 20

void test__count_number_in_array();
int count_number_in_array(int *q,int size,int num);
void print_last_ele_in_array(int *p,int n,int pos);

int main(void)
{
	int array[NUM]={};
	int i;
	for ( i = 0; i < NUM; i++)
		array[i] = i;
	int m;
	printf("input m:\n");
	scanf("%d",&m);
	print_last_ele_in_array( array,NUM,m );
//	test__count_number_in_array();
	return 0;
}

void print_last_ele_in_array(int *p,int n,int pos)
{
	int i;
	int array[NUM]={}; //数组初始化为0；
	int *temp = array;
	int *q=array;
	
	while( count_number_in_array(q,NUM,0) > 1)
	{
		while( *q != 1  && ((pos-1) > 0) ) //q 指向当前不为1的元素
		{
			while( *(q+1)==1)
			{
				q++;
				if( q == temp+NUM );
					q = temp;
			}
			q++;
				if( q == temp+NUM );
					q = temp;
			pos--;
		}
		*q = 1;
	}
	printf("%d\n",*q);
}

void test__count_number_in_array()
{
	int arr[10]={2,2,3,3,3,4,4,4,4,4};
	if ( 2 ==  count_number_in_array(arr,10,2) && 
		 3 == count_number_in_array(arr,10,3) &&
		 5 == count_number_in_array(arr,10,4))
		printf("TEST count_number_in_array PASSED!\n");
	else
		printf("TEST count_number_in_array FAILED!\n");

}
int count_number_in_array(int *q,int size,int num)
{
	int i,count=0;

	for ( i = 0; i < size; i++ )
	{
		if( q[i] == num )
		{
			count++;
		}
	}
	return count;
}


/*
 *从数组里删除一个元素，返回删除元素后的数组
 *如果数组长度为1，结束删除
 *
 *
 * */
