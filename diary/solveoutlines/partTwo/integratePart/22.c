#include <stdio.h>

int main()
{
	int num,reverse_num,last_bit_num;
	reverse_num = 0;


	printf("please input a num:\n");
	scanf("%d",&num);
	while(num!=0)
	{
		last_bit_num = num % 10;
		reverse_num = reverse_num * 10 + last_bit_num;
		num = num /10;
	}
	printf("reversed number is %d \n",reverse_num);
	return 0;
}
