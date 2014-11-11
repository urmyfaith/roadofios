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
		return 0;
	}
	return x/y;
}

int  mod(int x,int y)
{
	return x%y;
}

void get_result(char ch,int x,int y)
{
	switch(ch)
	{
		case '+':
			printf("%d\n",add(x,y));
			break;
		case '-':
			printf("%d\n",minus(x,y));
			break;
		case '*':
			printf("%d\n",mul(x,y));
			break;
		case '/':
			printf("%d\n",chu(x,y));
			break;
		case '%':
			printf("%d\n",mod(x,y));
			break;
		default:
			break;
	}
	
}

int main()
{
	int a,b;
	float result;
	char ch;
	printf("+,-*,/,%%,numbera numberb\n");
	scanf("%c%d%d",&ch,&a,&b);

	printf("ch=%c\na=%d\nb=%d\n",ch,a,b);
	get_result(ch,a,b);
	return 0;
}

