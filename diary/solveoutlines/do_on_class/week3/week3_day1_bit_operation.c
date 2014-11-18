#include <stdio.h>

int main()
{
	int a = 0b10100100;
	int b = 0b11000100;
	int c = a & b;

	printf("%d",c);
	printf("%d",a|b);
	return 0;
}

#if 0
位与，位或，安位取反，异或，左移，右移

&
|
~
^
<<
>>
#endif

