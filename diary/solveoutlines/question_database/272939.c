#include <stdio.h>

int main()
{
	int n;
	int sum = 1;
	int i;

	scanf("%d",&n);
	for(i = 1; i<=n; i++)
	{
		sum = sum * i;
	}
	printf("%d",sum);

	return 0;
}