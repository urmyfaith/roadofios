#include <stdio.h>

int main(void)
{
	int a = 3;
	int b = 4;
	int *p1 = &a;
	int *p2 = &b;

	printf("%p,%d\n",p1,*p1);
	printf("%p,%d\n",p2,*p2);
	printf("%ld\n",p2 - p1);
	printf("%ld\n",p1 - p2);


	return 0;
}
