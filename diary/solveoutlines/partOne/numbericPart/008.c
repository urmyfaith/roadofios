#include<stdio.h>

int main()
{
	int m=0,n=0,a=0,b=0,c=0,d=0;
	int temp;

	temp = (m=a==b)||(n=c==d);
	printf("m=%d\nn=%d",m,n);
}

#if 0
||  短路性质，如果有一个为0，那么，值为0；从左到右
先算左边的：
= 优先级没有==优先级高
先算==
a==b为真，m=1赋值。
temp=（m=1）|| （n=c==d）
||由于短路，temp=1，
（n=c==d）没有进行计算。
#endif
