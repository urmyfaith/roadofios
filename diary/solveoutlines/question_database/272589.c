#include <stdio.h>

int main()
{
	int x,y;

	scanf("%d%d",&x,&y);

	printf("%d",(5 * x - 3 * y)%4);
	return 0;
}
