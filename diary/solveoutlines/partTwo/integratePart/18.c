#include <stdio.h>

int main()
{
	int i,j;
	int sum = 0;

	for(i=1;i<=100;i++)
	{
		for(j=0;j<=i;j++)
		{
			sum = sum + j;
		}
		printf("0+...+%d+%d=%d\n",i-1,i,sum);
		sum = 0;
	}
    
	return 0;
}
