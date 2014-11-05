#include <stdio.h>

int main(void)
{
	char ch;
	scanf("%d",&ch);
	
	if( (ch>64 && ch<90) ||(ch>96&&ch<123))
		printf("YES");
	else
		printf("NO");
	return 0;
}
