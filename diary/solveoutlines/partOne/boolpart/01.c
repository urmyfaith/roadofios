#include<stdio.h>

int main()
{
	int a =1;
	printf("a=1\t%d\na==1\t%d\n",a=1,a==1);
	return 0;
}

#if 0
a=1 是复制表达式，值位1
a==1，判断a的值与1是否相等，是，值位的1
#endif
