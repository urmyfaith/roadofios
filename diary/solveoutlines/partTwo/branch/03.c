#include<stdio.h>

int main()
{
	char ch;
	printf("please input a char:\n");
	scanf("%c",&ch);

	if(ch>64&& ch<91)
		printf("char(%c) is an uppercase char.",ch);
	else
		printf("char(%c) is NOT an uppercase char.",ch);
	return 0;
}

#if 0
65 A
90 Z
#endif
