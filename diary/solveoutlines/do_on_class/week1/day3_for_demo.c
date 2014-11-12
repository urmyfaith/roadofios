#include <stdio.h>

int main(void)
{
	int i;
	int num=20;
	for(i=0;i<num;i++)
	{
		if(0==i%2)
			printf("%d\n",i);
	}
	return 0;
}
