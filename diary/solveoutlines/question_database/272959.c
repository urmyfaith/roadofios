#include <stdio.h>

int main()
{
	int temp,sum = 0;
	int i;
	
	for( i = 1;i <= 10; i++)
	{
		scanf("%d",&temp);
		sum = sum + temp;
	}
	printf("%d",sum/10);


	return 0;
}
