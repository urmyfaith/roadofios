#include<stdio.h>

int main()
{
	char ch;
	printf("please input a char:\n");
	scanf("%c",&ch);

	if(ch>='a'&& ch<='z')
		printf("char(%c)",ch-32);
	else
		printf("char(%c)",ch);
	return 0;
}

#if 0
65 A
90 Z

	97 a
	122 z
#endif
