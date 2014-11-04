#include<stdio.h>

int main()
{
	int num;
	printf("please input a number:\n");
	scanf("%d",&num);

	if(num/100==num%10)
		printf("num(%d) is symmetry number.",num);
	else
		printf("num(%d) is  not a symmetry number.",num);
	return 0;
}
