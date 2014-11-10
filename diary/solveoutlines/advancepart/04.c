#include <stdio.h>

int add_all_digits(int n);


int main()
{
	int num;
	scanf("%d",&num);

	printf("%d\n",add_all_digits(num));
	return 0;
}

int add_all_digits(int n)
{
	int  sum_of_all_digits= 0;
	while(n)
	{
		sum_of_all_digits += n % 10;
		n /= 10;
	}
	return sum_of_all_digits;
}
