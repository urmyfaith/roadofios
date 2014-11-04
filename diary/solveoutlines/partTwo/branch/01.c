#include<stdio.h>

int main()
{
	int num;
	printf("please input a number:\n");
	scanf("%d",&num);

	if(num%2==0)
		printf("num(%d) is an even number.",num);
	else
		printf("num(%d) is  not an even number.",num);
	return 0;
}
