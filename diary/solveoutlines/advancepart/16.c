//  判断一个从小到大排序好的数组，是否含有某个整数n
//
#include <stdio.h>

#define NUM 10


int is_number_in_array(int *p,int size,int n);

int main()
{
	int array[NUM]={1,2,3,4,5,6,7,8,9,10};
	int contain_num = 3;
	int flag;

	flag = is_number_in_array(array,NUM,contain_num);

	flag==0 ? printf("NO"):printf("YES");

	return 0;
}

int is_number_in_array(int *p,int size,int n)
{
	int flag = 0;
	int i;

	for ( i = 0 ;i < size; i++)
	{
		if ( *(p+i) == n )
		{
			flag = 1;
			break;
		}
	}

	return flag;
}

/*
 *  0 1 2 3 4 5 6 7 8 9  下标
 *  1 2 3 4 5 6 7 8 9 10
 *  p				   q
 *  
 *
 * */
