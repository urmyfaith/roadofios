#include <stdio.h>

#define NUM 10

int closeToNum(int *arr,int len,int n);

int main()
{
	int array[NUM]={1,3,5,7,9,11,15,25,35,46};
	int n;
	int i;
	for (i = 0; i < NUM; i++ )
	{
		printf("%3d",array[i]);
	}
	printf("\n");
	printf("input clsoe to n:\n");
	scanf("%d",&n);

	printf("close to %d is \t%d.\n",n,closeToNum(array,NUM,n));

	return 0;	
}
int closeToNum(int *arr,int len,int n)
{
	int i;
	int sub_array[NUM]={};
	int min_flag;
	//记录每一个元素与n的差值，
	for ( i = 0; i < len; i++ )
	{
		sub_array[i] = arr[i]-n;
		sub_array[i] = sub_array[i] >0 ? sub_array[i] : -sub_array[i];
	}
	//返回第一个差值最小的下标；
	min_flag = 0;
	for ( i = 1; i < NUM ; i++)
	{
		min_flag = sub_array[min_flag] > sub_array[i]? i : min_flag;
	}

	return arr[min_flag] ;
}
