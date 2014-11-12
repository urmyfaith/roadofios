#include <stdio.h>

int main()
{
	int num;
	scanf("%d",&num);

	for(int i=2;i<num;i++)
	{
		if(num%i==0)
		{
			printf("num(%d=%d*%d) is not a prime.",num,i,num/i);
			return 0;
		}
	}
	printf("%d is a prime.",num);
	return 0;
}
