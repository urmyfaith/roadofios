#include <stdio.h>
#define NUM 5
unsigned int maxCommonDivisor( unsigned int *a,int n);

int main(void)
{
	unsigned int  array[NUM]={};
	int i;
	for ( i =0; i < NUM; i++ )
	{
		scanf("%d",&array[i]);
	}
	printf("%d\n",maxCommonDivisor(array,NUM));
	return 0;
}
unsigned int maxCommonDivisor( unsigned int *a,int n)
{
	int i,j,flag;
	unsigned int min=a[0];

	//找出数组中最小的数；
	for ( i = 0; i < n; i++ )
	{
		if(min>a[i])
			min = a[i];
	}
	
	// 数组中的每一个数对最小数取余
	// 最小的数--
	// 值到所有的数都可以对某个数除尽，结束循环，
	// 输出
	for ( i = min; i>0; i-- )
	{
		for ( j = 0; j < n; j++ )
		{
			if ( a[j]%i != 0 )
				break;
		}
		if( j == n)
		{
			flag = i;
			break;
		}
	}
	return flag;
}
