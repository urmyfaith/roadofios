#include<stdio.h>

int main()
{
	int num;
	printf("please input a num:\n");
	scanf("%d",&num);
	if(num%7==0 && num%3==0)
		printf("num(%d) can divide by 7 and 3 !",num);
	else
		printf("num(%d) can not divide by  7 and 3 !",num);
	return 0;
}

#if 0
num%7==0 && num%3==0
优先级：
%
==
&&

所以可以不用括号。
但是最好用括号：

(num%7==0) && (num%3==0)

#endif
