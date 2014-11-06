#include <stdio.h>

int main()
{
	int x,y;
	int max,min;
	scanf("%d%d",&x,&y);
	max = x>y?x:y;
	min = x<y?x:y;

	printf("%d",max-min);
	return 0;
}
