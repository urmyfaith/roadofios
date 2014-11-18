#include <stdio.h>
#include <string.h>

union test
{
	int n;
	char ch;
};

int main()
{
	union test num;
	num.n = 65;
	printf("%c",num.ch);

	return  0;
}
