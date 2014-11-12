#include <stdio.h>

long double fac(int n);

int main()
{
	int num;
	scanf("%d",&num);
	printf("%.Lf\n",fac(num));
	return 0;
}

// 6!=6*5!
// 5!=5*4!
//
long double fac(int n)
{
	if( n==1 )
		return 1;
	else
		return  n * fac(n-1);
}
