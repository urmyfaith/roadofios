#include<stdio.h>

int main()
{
	int a =1,b=5;
	printf("a++=%d,++b=%d",a++,++b);
#if 0
	a++ --> 1
	++b --->6
#endif
	return 0;
}
