#include <stdio.h>

int main()
{
	int x,y;

	scanf("%d",&x);
	
	if(x<0)
		printf("%d",y = x * x);
	else
	{ 
		if(x>=0 && x<5)
			printf("%d",y = 2 * x + 1);
		else
			printf("%d",y = 3 * x - 12);
	}
	return 0;
}
