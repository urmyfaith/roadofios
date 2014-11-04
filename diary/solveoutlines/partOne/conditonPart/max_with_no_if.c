#include<stdio.h>

int main()
{
	int a=3,b=4,c=5;
	int max;
	max = a>b?a:b;
	max= max>c?max:c;
	
	printf("max is %d\n",max);

	return 0;
}

#if 0
还有什么方法？

#endif
