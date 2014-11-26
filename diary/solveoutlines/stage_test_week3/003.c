#include<stdio.h>

int sumOfNumberInString(const char *str)
{
	int sum=0;
	int i=0;
	while(str[i]!='\0')
	{
		sum += str[i]-'0';
		i++;
	}
	return sum;
}
int main(void)
{
	char str[10]="12345";
	printf("%d",sumOfNumberInString(str));
	return 0;
}
