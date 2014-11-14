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

	int max = *p;
	int sum = *p;
	int i;
	int flag_i;

	//仅仅一个循环，时间复杂度 O(n)
	//但是对下标的保存是个问题，究竟是哪几个元素的和？
	for ( i = 1; i < n; i++)
	{
		if (sum > 0 )
			sum += p[i];
		else
			sum = p[i];
		if( sum > max)
		{
			flag_i = i;
			max = sum;
		}
	}
	printf("flag_i=%d\n",flag_i);
	return max;	
}

#if 0
当我们加上一个正数时，和会增加；
当我们加上一个负数时，和会减少。

如果当前得到的和是个负数，
那么这个和在接下来的累加中应该抛弃并重新清零，
不然的话这个负数将会减少接下来的和。

#endif


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

