#include <stdio.h>

long unsigned int fac(int n);

int count_zero(long unsigned int  n);

int  main()
{
	int num;
	long unsigned int  temp;
	scanf("%d",&num);
	
	temp = fac(num);

	printf("%d!=%ld\n",num,temp);
	printf("%d\n",count_zero(temp));

	return 0;
}

long unsigned int  fac(int n)
{

	long unsigned int f;
	if( 1 == n )
	
		f = 1;
	else
		f = fac(n-1)*n;
	return f;
}

int count_zero(long unsigned int  n)
{

	int count = 0;

	printf("%ld\n",n);
	while(n)
	{
		if ( n%10  == 0)
			count++;
		n /= 10;
	}
	return  count ;
}


