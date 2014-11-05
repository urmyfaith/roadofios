#include <stdio.h>

int main()
{
	int i;
	int num = 1077;
	for(i=2;i<num;i++)
	{
		if(num%i==0)
		{
			printf("%d is not a prime.\n",num);
			printf("%d=%d*%d\n",num,i,num/i);
			return 0;
		}
	}
	printf("%d is a prime.",num);
	return 0;
}
