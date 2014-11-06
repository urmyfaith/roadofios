#include <stdio.h>
#include <math.h>

int main(void)
{
	int num,sum = 0 ,last_bit;
	scanf("%d",&num);
	int digit = 0;
	while(num)
	{
		last_bit = num % 2;
		num = num / 2;
		sum = last_bit * pow(10,digit) + sum ;
		digit = digit + 1;
	}
	printf("sum = %d",sum);
	return 0;
}
