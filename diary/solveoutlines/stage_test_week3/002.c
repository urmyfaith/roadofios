#include <stdio.h>

int secondMaxItem(int *arr,int n)
{
	int i;
	int flag_max=0,flag;

	//找出最大的数
	for( i = 0; i < n ; i++ )
	{
		if( arr[flag_max] < arr[i] )
		{
			flag_max = i;
		}
	}
	//找出次大的数:
	flag = (flag_max+1) % n;
	for(i = 0; i < n; i++ )
	{
		if(i != flag_max)
		{
			if( arr[flag] <  arr[i] )
			{
				flag = i;
			}
		}
	}
	return arr[flag];
	
}

int main(void)
{
	//int a[10]={1,2,3,4,5,6,7,8,9,10};
	int a[10]={10,9,8,7,6,5,4,3,2,1};
	printf("%d",secondMaxItem(a,10));
	return 0;
}
