#include <stdio.h>

int main()
{
	int count = 0;
	char ch;
	int flag = 0;
	int i=0;
	int last_i=0;
	
	while( '\n' != (ch = getchar()))
	{
		
		//一行数，得到ei的次数。
		if( 'e'== ch )
		{
			flag = 1;
			last_i = i;
		}
		if( 'i'== ch && flag == 1)
		{
			if( 1 == ( i - last_i ))
			{
				count = count +1;
				flag = 0;
			}
		}
		i++;
	}
	printf("%d",count);
}

#if 0

对每个输入的字符判断。
如果输入的是e，那么flag标志位1

如果输入的是i的情况下：

	如果flag=1（上一个字符是e），
	那么计数。
last_i 的作用， 判断2ei是否是两个连续的字符。

#endif
