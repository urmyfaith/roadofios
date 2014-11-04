#include<stdio.h>

int main()
{
	printf("-1<=3<=-5\t\%d\n",-1<=3<=-5);
	printf("-1<=3<=2\t\%d\n",-1<=3<=2);
	return 0;
}

#if 0
<= 的运算顺序是从左到右，那么
先算左边的-1 <=3   结果为真，1
1<=-5,结果位假,0
#endif
