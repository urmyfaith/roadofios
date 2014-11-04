#include<stdio.h>

int main()
{
	char ch;
	printf("please input a char\n");
	scanf("%c",&ch);
	
	if((ch>64 && ch <91 )|| (ch>96 && ch<123))
		printf("Yes,it's a char.\n");
	else
		printf("No,it's NOT  a char.");

	return 0;
}

#if 0
ASCII 码表：
65 A
90 Z
97 a
122 z
#endif
