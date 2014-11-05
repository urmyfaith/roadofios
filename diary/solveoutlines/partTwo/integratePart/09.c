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
		sum = sum + i;
	}

	printf("%d+%d+...+%d+%d=%d\n",startNum,startNum+1,endNum-1,endNum,sum);
	 
	return 0;
}
