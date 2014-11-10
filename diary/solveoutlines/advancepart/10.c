#include <stdio.h>

// f(n) = f(n-1) + f(n-2)
// f(n) = f(1) + f(0)  = 1 + 1
// f(4) = f(3) + f(2) = f(2) + f(1) + f(2) = 2*(f(1)+f(0))  + f(1) = 5

int fibonacci(int n)
{
	int f;
	if (n == -1)
		f = 0;
	if(n==1 || n== 0)
		f  = 1;		
	else
		f = fibonacci(n-1) + fibonacci(n-2);
	return f;
}



int main()
{
	int num = 20;
	//scanf("%d",&num);
	fibonacci(num);
	for ( int i =0 ; i < num ; i++)
	{
		printf("%10d",fibonacci(i));
		if( 0 == (i+1)%5 )
			printf("\n");
	}
	printf("\n");
	return 0;
}
