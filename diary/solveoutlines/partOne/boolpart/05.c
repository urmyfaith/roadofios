#include<stdio.h>

int main()
{
	int a=3,b=4,c=5;
	printf("!(a>b)&&!c||1\t%d\n",(!(a>b)&&!c||1));
	return 0;
}

#if 0
优先级最高（）
a>b  3>4 0
!(a>b) !0 1
1&&!c||1
c为5，！c=0
1&&0||1

那么，&& 和|| 的优先级，||的优先级高
那么0||1的值位1
1&&1 的值位1
最后结果为1
#endif
