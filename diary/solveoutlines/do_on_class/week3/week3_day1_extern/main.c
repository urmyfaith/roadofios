#include <stdio.h>

extern int a;
extern void my_print_2(void);
int  main(void)
{
	printf("&a=%p\ta=%d\n",&a,a);
	my_print_2();
	return 0;
}
