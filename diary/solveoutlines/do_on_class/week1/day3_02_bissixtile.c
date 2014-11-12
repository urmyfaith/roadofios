#include<stdio.h>

int main()
{
	int year;
	int flag=0;

	printf("intput a year:\n");
	scanf("%d",&year);
	if(year%4!=0)
	{
		flag=0;
	}
	else
	{
		if(year%100!=0)
		{
			flag =1;
		}
	}
	if(year%400==0)
	{
		flag =1;
	}
	
	if(flag)
		printf("year(%d) is  prime year!",year);
	else
		printf("year(%d) is not prime year!",year);
	return 0;
}

#if 0

if( (year%4==0 && year%100!=0) || year%400==0)

#endif
