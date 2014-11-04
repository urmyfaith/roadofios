#include<stdio.h>

int main()
{
	int a=3,b=4,c=5;
	printf("a+b>c&&b==c\t%d\n",( a+b>c&&b==c ));
	return 0;
}

#if 0
a+b>c && b==c
+的运算优先级最高
a+b>c 3+4>5 7>5 0
0&&b==c
==优先级高于&&
0&&(4==5)
0&&0
最后结果为0
#endif
