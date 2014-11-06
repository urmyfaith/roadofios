#include <stdio.h>

#define NUM 5

int main()
{
	char array[NUM]={'1','2','3','3','2'};
	int i,num = 0;

	for( i = 0; i < NUM; i++)
	{
		int digit = 0;
		digit = array[i]-'0';
		num = num * 10 + digit;
	}
	printf("num=%d\n",num);

	return 0;
}

#if 0
读取每一位，求和，对之前的数*10

1
sum = 1
2
sum = 1*10 +2 = 12
3
sum = 12* 10 +3 = 123

顺序刚好相同。

#endif
