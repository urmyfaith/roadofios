#include <stdio.h>

int main()
{
	int numA,numB,numC;
	int min,mid,max; 
	printf("please input threee numbers: a,b,c\n");
	scanf("%d,%d,%d",&numA,&numB,&numC);
	
	min = numA<numB?numA:numB;
	min = min<numC?min:numC;

	max = numA>numB?numA:numB;
	max = max>numC?max:numC;

	mid = numA+numB+numC-min-max;
	printf("%d,%d,%d",min,mid,max);
	
	return 0;
}
