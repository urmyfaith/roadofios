#include <stdio.h>

#define N 5

int main()
{
	int a[5]={1112,12,34,56,78};
	int b[5]={23,30,25,47,69};

	int i,flag = 1,sumA = 0, sumB = 0;

	for ( i = 0 ; i < N ; i++ )
	{
		while(a[i])
		{
			sumA += a[i]%10;
			a[i] /= 10;
		}
		while(b[i])
		{
			sumB += b[i]%10;
			b[i] /= 10;
		}
		if( sumA != sumB)
		{
			flag =0;
			printf("a[%d]!=b[%d]\n",i,i);
			break;
		}
	}
	
	if(flag)
	{
		printf("YES\n"); //相同则输出YES
	}
	else
	{
		printf("NO\n"); //不同则输出NO
	}
	
	return 0;
}

#if 0
思路：
依次取出数组的每一个元素：

算出元素的合值
比较和值：如果不同，标志不同，跳出循环，输出
		  如果相同，保持标志位不变。

#endif
