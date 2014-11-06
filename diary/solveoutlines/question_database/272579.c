#include <stdio.h>

int main()
{
	int num;
	scanf("%d",&num);
	if(num>100)
		printf("YES");
	if(num>=0 && num<=100)
		printf("NO");
	return 0;
}
