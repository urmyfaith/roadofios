#include <stdio.h>

int main()
{
	int i;
	int num;
	int result;

	num = 10;
	result = 1;

	for(i=1;i<=num;i++)
	{
		result = result * i ; 
	}

	printf("%d!=%d\n",num,result);
	
	return 0;
}
