#include <stdio.h>

int main()
{
	int m,n,i;
	double result = 1.0;

	scanf("%d%d",&m,&n);
	
	for ( i = 1; i <= n ; i++ )
	{
		result = result * m;
	}
	printf("%.f\n",result);

	return 0;
}
