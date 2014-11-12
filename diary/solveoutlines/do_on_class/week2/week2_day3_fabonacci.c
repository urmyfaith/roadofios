#include <stdio.h>
#include <unistd.h>

int fabonacci(int n);

int main(void)
{
	int num,i;
	scanf("%d",&num);

	printf("fabonacci(%d)=%d\n",num,fabonacci(num));
	
	for( i = 1; i <= num; i++)
	{
		printf("%10d",fabonacci(i));
		fflush(stdout);
		sleep(1);
		if( i%5 == 0)
			printf("\n");
	}

	return 0;
}

int fabonacci(int n)
{
	if ( n == 1 || n == 2 )
	{
		return 1;
	}
	else
		return fabonacci(n-1) + fabonacci(n-2);
}
