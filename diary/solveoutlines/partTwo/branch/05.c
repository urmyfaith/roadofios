#include<stdio.h>

int main()
{
	char ch;
	printf("please input a char:\n");
	scanf("%c",&ch);

	if(ch>=48 && ch<=57)
		printf("YES");
	else
		printf("NO");
	return 0;
}

#if 0
65 A
90 Z

	97 a
	122 z
48 0
57 9
#endif
