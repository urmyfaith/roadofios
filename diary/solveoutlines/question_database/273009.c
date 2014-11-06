#include <stdio.h>

int main()
{
	int num,i = 2 ;
	int temp;
	int flag = 1;
	scanf("%d",&num);
	temp = num;
	while(flag)
	{	
		for( i = 2; i <= temp ; i++)
		{	
			if( (0 == temp%i)) 
			{
				printf("%d ",i);
				if( i == temp )
				{
					flag = 0;
					break;
				}
				temp = temp/i;
				break;
			}

		}
		i = 2;
	}

	return 0;
}

#if 0
对一个数判断是否是素数。
从小到大判断，可以被整出，那么输出这个因子。
得到除数。

对除数判断是否是素数。

如果最后temp==i，那么说明，这是最后一个质数。结束循环。


#endif
