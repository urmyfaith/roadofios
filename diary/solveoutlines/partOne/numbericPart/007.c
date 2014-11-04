#include<stdio.h>

int main()
{
	int a=3,b=4;
	printf("a=%d,b=%d\n",a,b);
	a= a+b;
	b =a-b;
	a =a-b;
#if 0
	a=a^b;
	b=b^a;
	a=a^b;
#endif
	printf("a=%d,b=%d\n",a,b);
	return 0;
}
