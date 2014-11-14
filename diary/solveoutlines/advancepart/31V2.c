//求数组的 连续子数组，这个连续子数组是所有的连续子数组的元素和最大。

#include <stdio.h>

#define NUM 9

int max_sum(int *p,int n);

int main()
{
	int array[NUM] = {-2,1,-3,4,-1,2,1,-5,5};
	printf("max_sum = %d\n",max_sum(array,NUM));

	return 0;
}

int max_sum(int *p,int n)
{
	int  max= -1.0/0.0;
	int sum = 0;
	int i,j,k;
	int flag_i,flag_k;

	for( i = 0; i < n ; i++ )
	{
		for( j = i; j < n; j++ )
		{
			for ( k = i; k <= j; k++)
			{
				sum = sum + p[k];
			}
			if(sum > max)
			{
				max = sum;
				flag_i=i;
				flag_k=k-1;
			}
			sum = 0;
		}
	}
	for ( i = flag_i;i <= flag_k ; i++)
	{
		printf("%d\t",p[i]);
	}
	printf("\n");
	return max;	
}

#if 0

设sum[i]为以第i个元素结尾且和最大的连续子数组。
sum[i] <=== ...+ a[i]

假设对于元素i，所有以它前面的元素结尾的子数组的长度都已经求得，

以第i个元素结尾且和最大的连续子数组实际上，
	* 要么是以第i-1个元素结尾且和最大的连续子数组加上这个元素，
	* 要么是只包含第i个元素，
	
即sum[i] = max(	sum[i-1]+a[i], a[i] )。

可以通过判断sum[i-1] + a[i]是否大于a[i]来做选择，
而这实际上等价于判断sum[i-1]是否大于0。

#endif
