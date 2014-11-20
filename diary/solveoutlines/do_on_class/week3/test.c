#include <stdio.h>

int main(void)
{
	int a=1;
	const float b = 1.1;
	a = (int)b;
	printf("%d\n",a);
	printf("%f\n",b);

	return 0;
}
