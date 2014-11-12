#include <stdio.h>

int main()
{
	const int a=0;
//	a=5;
	const int *p=&a;
	*p = 5
	printf("%d,%d\n",a,*p);
	return 0;
}
