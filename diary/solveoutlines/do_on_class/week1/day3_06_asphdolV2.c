#include <stdio.h>

int main(void)
{
	int num,sum,temp,one_digit;
	sum = 0;
	one_digit = 0;

	scanf("%d",&num);
	
	temp = num;
	while( 0!=temp)
	{
		one_digit = temp % 10;
		sum += one_digit * one_digit * one_digit;
		temp = temp /10;
	}
	printf("sum=%d\n",sum);
	if(num!=sum)
	{
		printf("number %d is NOT a asphdol number.",num);
	}
	else
	{
		printf("number %d is  a asphdol number.",num);
	}
	

	return 0;
}
