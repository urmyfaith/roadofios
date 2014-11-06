#include <stdio.h>

int main()
{
	int num,last_digit,sum = 0;
	scanf("%d",&num);
	
	while(num)
	{
		last_digit = num %10;
		sum = sum*10 + last_digit;
		num /= 10;
	}
	printf("%d",sum);
	return 0;
}
