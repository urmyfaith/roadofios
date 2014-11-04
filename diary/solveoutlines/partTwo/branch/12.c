#include<stdio.h>

int main()
{
	int x;
	printf("please input a number:\n");
	scanf("%d",&x);

	if(x<=1)
		printf("y=1");
	else
	{
		if(x<10)
			printf("y=%d\n",x);
		else
		{
			printf("y=2*x+1\n =2*%d+1\n =%d\n",x,2*x+1);
		}
	}
	return 0;
}
