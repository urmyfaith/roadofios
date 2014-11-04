#include<stdio.h>

int main()
{
	int num;
	printf("please input a num:\n");
	scanf("%d",&num);

	if(num>=0)
	{
		printf("%d\n",num);
	}
	if(num<0)
	{
		printf("%d\n",-num);
	}
	return 0;
}
