#include<stdio.h>

int main()
{
	int a=0;
	for(;a<20;a++)
	{
		if((a%5==3)&&(a%7==4)&&(a<20))
			printf("a=%d",a);
	}
	return 0;
}

#if 0
#endif
