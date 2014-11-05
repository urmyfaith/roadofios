#include <stdio.h>

int main()
{
	int num,last_digit,sum;
	sum = 0;
	
	printf("add each digit of a number:\n");
	scanf("%d",&num);
	while(num!=0)
	{
		last_digit = num % 10;
		sum = sum + last_digit;
		num = num / 10;

	}
	printf("sum each  digit of a number is %d:\n",sum);
	return 0;
}
