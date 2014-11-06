#include <stdio.h>
#include <math.h>

int main(void)
{
	int num,i,sum = 0 ,last_bit;
	scanf("%d",&num);
	
	for(i = 0; num > 0 ;i++)
	{
		last_bit = num % 2;
		sum = last_bit * pow(10,i) + sum;
		num /= 2;
	}
	printf("%d",sum);
	return 0;
}
