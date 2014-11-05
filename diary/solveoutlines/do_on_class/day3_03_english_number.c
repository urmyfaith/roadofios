#include <stdio.h>

int main(void)
{
	char ch;
	scanf("%d",&ch);
	
	if( (ch>64 && ch<90) ||(ch>96&&ch<123))
		printf("YES\n");
	else
		printf("NO\n");
	return 0;
}

#if 0
	if(ch>='A'&& ch <='Z' || ch >='a'&& ch <='z')
#endif
