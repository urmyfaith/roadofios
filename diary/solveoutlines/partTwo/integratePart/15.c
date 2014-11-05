#include <stdio.h>

int main()
{
	int i,startNum,endNum;
    int sum;

	sum = 0;
	startNum = 1;
	endNum = 100;

	for(i=startNum;i<=endNum;i++)
	{
		if( ( i%7==0 || i%3==0 )  && !(i%7==0 && i%3==0))
		{
			sum = sum + i;
		}
	}

	printf("f(x)|sum(1,100),conditon()=%d\n",sum);
	 
	return 0;
}
