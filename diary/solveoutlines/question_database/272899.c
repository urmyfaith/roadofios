#include <stdio.h>

int main()
{
	int num;
	int count = 0;
	scanf("%d",&num);
	
	if( 0==num)
		count = 1;

	while(num)
	{
		count += 1;
		num /= 10;
	}
	printf("%d",count);

	return 0;
}
