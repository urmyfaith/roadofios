#include <stdio.h>

int main(void)
{
	int num,digit;
	scanf("%d",&num);
	scanf("%d",&digit);
	printf("%d",num | (1<<digit) );
	return 0;
}
