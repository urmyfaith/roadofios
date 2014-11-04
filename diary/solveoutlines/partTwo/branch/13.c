#include <stdio.h>

int main()
{
	int hour,min,sec;
	printf("please input a time:\t HH:MM:SS\n");
	scanf("%d:%d:%d",&hour,&min,&sec);

	if(59==sec)
	{
		sec = 0;
		if(59==min)
		{
			min = 0;
			if(24==hour)
				hour =0;
			else
				hour = hour + 1;
		}
		else
		{
			min = min + 1;
		}
	}
	else
	{
		sec = sec + 1;
	}
	
	printf("the next second is:\n%02d:%02d:%02d\n",hour,min,sec);

	return 0;
}
