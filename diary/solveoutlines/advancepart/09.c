#include <stdio.h>

void print_flower_number()
{
	int  i,sum,temp,one_digit;

	for ( i = 100; i<1000; i++)
	{
		temp = i;
		sum = 0;
		while(temp)
		{
			one_digit = temp%10;
			sum += one_digit * one_digit * one_digit;
			temp /= 10;
		}
		if( i == sum)
		{
			printf("%d\n",sum);
		}
	}
}

int main()
{

	print_flower_number();
	return 0;
}
