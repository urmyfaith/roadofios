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
		if(i%2==1)
		{
			sum = sum + i;
		}
	}

	printf("1+3+...+999=%d\n",sum);
	 
	return 0;
}
