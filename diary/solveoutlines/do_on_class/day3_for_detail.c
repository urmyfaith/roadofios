#include <stdio.h>

int main()
{
	int i;
	int num = 5;
	int j =1;

	for(printf("A--\n"),i = 1; printf("B--\n"),j++,i < num; printf("D---\n"),i++,printf("\n\n"))
	{
		printf("C---\n");
		printf("i = %d\n",i);
		printf("j = %d\n",j);
	}
	return 0;
}

#if 0
if语句的执行顺序：

A-->B-->C-->D-->B-->C-->D-->B


注意：
	A只执行1次
	B在第一次的也是执行。
	最后跳出循环，要么是在C中break，return或者在B中跳出循环。

#endif

