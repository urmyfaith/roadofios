#include <stdio.h>

int add(int x,int y)
{
	return x+y;
}

int minus(int x,int y)
{
	return x-y;
}
int mul(int x,int y)
{
	return x*y;
}
int chu(int x,int y)
{
	if( y==0 )
	{
		printf("divide by zero.");
	}
	return x/y;
}


int main()
{
	int a,b;
	float result;
	char ch;
	printf("+,-*,/,%%,numbera numberb\n");
	scanf("%c%d%d",&ch,&a,&b);

	printf("ch=%c\na=%d\nb=%d\n",ch,a,b);
	return 0;
}
