#include <stdio.h>

int reverse_number(int n)
{
	int last_digit,new_num = 0;
	while(n)
	{
		last_digit = n %10;	//取出最后一位；
		new_num = new_num*10 + last_digit;
		n /= 10;				//去掉最后一位；
	}
	return new_num;
}



int main()
{
	int num;

	scanf("%d",&num);

	printf("%d",reverse_number(num));


	return 0;	
}
