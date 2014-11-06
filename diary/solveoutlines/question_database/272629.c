#include <stdio.h>

int main()
{
	int year;
	scanf("%d",&year);

	if(0==year%4 && 0!=year%100)
	{
		printf("YES");
		return 0;
	}
	if(0==year%400)
	{
		printf("YES");
		return 0;
	}
	printf("NO");	
	return 0;
}
