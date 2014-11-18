#include <stdio.h>

void test(void);

int a = 100;

int main()
{
	a = 1000;
	printf("main:a=%d\n",a);
	int a = 10;
	printf("main:a=%d\n",a);
	{
		int	 a = 15;
		printf("code block:a=%d\n",a);
		a  = 20;
		printf("code block:a=%d\n",a);
	}
	printf("main:a=%d\n",a);

	test();
	return 0;
}


void test(void)
{
	printf("test:a=%d\n",a);
}
