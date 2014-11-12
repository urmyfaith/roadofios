#include <stdio.h>

long double fac(int n);

int main()
{
	int num;
	scanf("%d",&num);
	printf("%.f\n",fac(num));
	return 0;
}

// 6!=6*5!
// 5!=5*4!
//
long double fac(int n)
{
	long double static f;
	if( n==1 )
		f = 1;
	else
		f = n * fac(n-1);
	return f;
}
