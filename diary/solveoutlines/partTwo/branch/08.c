#include <stdio.h>

int main()
{
	int numA,numB,numC;
	int small=0;
	printf("please input threee numbers: a,b,c\n");
	scanf("%d,%d,%d",&numA,&numB,&numC);

	small=numA<numB?numA:numB;
	small=small<numC?small:numC;
	printf("the smallest  of %d,%d,%d is %d\n",numA,numB,numC,small);
	
	return 0;
}
