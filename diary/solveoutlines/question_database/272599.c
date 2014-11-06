#include <stdio.h>

int main()
{
	int a,b,c;
	scanf("%d%d%d",&a,&b,&c);

	printf("%d",(b * b - 4 * a * c)/(2 * a));
	return 0;
}
