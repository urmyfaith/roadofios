#include<stdio.h>

int main()
{
	int a;
	int i=2;
	a=(i++,i++,i++);

	printf("a=%d,i=%d\n",a,i);
}
#if 0
逗号表达式的值为最后一个。
i自增三次，i=5
a=(2,3,4);
那么a=4；
#endif
