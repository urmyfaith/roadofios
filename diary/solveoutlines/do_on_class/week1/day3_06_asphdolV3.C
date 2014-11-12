#include <stdio.h>

int main(void)
{
	int i,sum,temp,one_digit,start_num,end_num;
	sum = 0;
	one_digit = 0;
	start_num = 100;
	end_num =999;

	for( i=start_num;i<=end_num;i++)
	{
		temp = i;
		while( 0!=temp)
		{
			one_digit = temp % 10;
			sum += one_digit * one_digit * one_digit;
			temp = temp /10;
		}
		if(i==sum)
		{
			printf("number %d is  a asphdol number.\n",i);
		}
		sum = 0;
	}

	return 0;
}
