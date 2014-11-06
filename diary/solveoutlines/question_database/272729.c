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
	if(num==sum)
	{
			printf("YES");
		}
	else
	{
			printf("NO");
	}
	

	return 0;
}

