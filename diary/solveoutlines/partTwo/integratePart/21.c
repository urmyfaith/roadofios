#include <stdio.h>

int main()
{
	int i;
	int num;
	int sum = 0;
	
	printf("add each digits of a num:\n");
	scanf("%d",&num);
	printf("you have input num:%d\n",num);

	while(num)
	{
		sum = sum + num%10;
		num = num /10;
	}
	printf("sum each digits of num is %d ",sum);

	return 0;
}
