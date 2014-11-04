#include<stdio.h>

int main()
{
	char ch ;
	printf("please input a char \n");
	scanf("%d",&ch);
	
	if(ch>47&&ch<58)
		printf("YES is char '%c'",ch,ch);
	else
		printf("NO %c is NOT a digit",ch);
	return 0;
}

#if 0
48 0
57 9
#endif
