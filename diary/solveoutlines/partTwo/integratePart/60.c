#include <stdio.h>

#define NUM 100


int main(void)
{
	char a[NUM] = "abcde";
	char b[NUM] = "abcdf";
	//char a[NUM] = "a";
	//char b[NUM] = "b";
	int i;
	int sum_a = 0,sum_b = 0;

	for ( i = 0 ; '\0' != a[i] ; i++ )
	{
		sum_a += a[i] + 0;
	}

	for ( i = 0 ; '\0' != b[i] ; i++ )
	{
		sum_b += b[i] + 0;
	}
	
	//printf("sum_a=%d,sum_b=%d",sum_a,sum_b);

	if ( sum_a > sum_b )
		printf("a>b");
	else
		if( sum_a < sum_b )
			printf("a<b");
		else
			printf("a=b");

	return 0;
}
