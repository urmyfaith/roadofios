#include <stdio.h>

int main()
{
	int i,startNum,endNum;
    int sum;

	sum = 0;
	startNum = 1;
	endNum = 1000;

	for(i=startNum;i<=endNum;i++)
	{
		if( i%3==0 && i%5==0 && i%7==0)
		{
			sum = sum + i;
		}
	}

	printf("f(x)|sum(1,100),conditon(i%%3==0 && i%%5==0 && i%%7==0)=%d\n",sum);
	 
	return 0;
}