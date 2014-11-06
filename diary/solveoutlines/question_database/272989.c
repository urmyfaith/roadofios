#include <stdio.h>
#include <math.h>

int main()
{
	int num,temp;
	int digits = 0;
	int one_digit;
	scanf("%d",&num);
	
	temp = num;

	while(temp)
	{
		//得到最高位？
		//得到次高
		temp /= 10;
		digits += 1;
	}

	while(num)
	{
		one_digit = num / pow(10,digits-1);
	//	printf("one_digit = %d\n",one_digit);
		printf("%d ",one_digit);
		num = num - one_digit * pow(10,digits-1);
	//	printf("num=%d\n",num);
		digits--;
	}
	return 0;
}

