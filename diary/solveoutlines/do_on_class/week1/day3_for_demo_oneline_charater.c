#include <stdio.h>

int main(void)
{
	char ch;
	ch = getchar();
	while(ch!='\n')
	{
		putchar(ch);
		ch = getchar();
	}
	printf("\n");
	return 0;
}
