#include <stdio.h>

//NULL 零地址；
//
int main(void)
{
    int *p = NULL;
	int a = 10;

    printf("%p\n",NULL);
    printf("%p\n",p);

	p = &a;
    printf("%p,%d\n",p,*p);
    printf("%p,%d\n",&a,a);
    printf("%p\n",&p);

    printf("%p\n",&p - &a);
    return 0;
}
