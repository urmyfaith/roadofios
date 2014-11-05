#include <stdio.h>

int main()
{
	int i;
	int height = 100;
	int current_height = height;
	int times = 0;
	int sum = 0;

	times = 10;

	for(i=0;i<times;i++)
	{
		current_height = current_height / 2;
		sum = sum + current_height * 2 +  current_height ;
	}
	printf("init height:%d\t after %d times,sum=%d",height,times,sum);
	return 0;
}

#if 0
第一次之后   100 + 100/2
第二次之后	 100 + 50		50 + 25
#endif
