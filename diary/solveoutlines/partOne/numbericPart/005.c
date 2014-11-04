#include<stdio.h>

int main()
{
	int number;
	printf("please input a number  bigger then 999\n");
	scanf("%d",&number);
	printf("%d",number/100%10);
	return 0;
}
