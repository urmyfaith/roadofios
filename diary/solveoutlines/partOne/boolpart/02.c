#include<stdio.h>

int main()
{
	int a =1;
	printf("!(a-2)\t%d\n",!(a-2));
	return 0;
}

#if 0
!(a-2)

首先，（）的优先级比！高
先算（）里面的
这样先算a-2
a-2的值位-1
这样
!(-1)
-1的非运算，-1为真，那么！（-1）为假，就是0
#endif
