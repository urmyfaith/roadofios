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
		printf("YES");
	else
		printf("NO");
	return 0;
}

#if 0
#endif
