#include <stdio.h>

int main()
{
	int num,i;
	scanf("%d",&num);

	for(i = 2; i < num ; i++ )
	{
		if( 0 == num%i )
		{
			printf("NO");
			return 0;
		}
	}
	printf("YES");
	return 0;
}
