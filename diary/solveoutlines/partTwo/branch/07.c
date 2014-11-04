#include <stdio.h>

int main()
{
	int numA,numB;
	printf("please input two nuber: a,b\n");
	scanf("%d,%d",&numA,&numB);
	
	printf("max of %d,%d is %d\n",numA,numB,numA>numB?numA:numB);
	
	return 0;
}
