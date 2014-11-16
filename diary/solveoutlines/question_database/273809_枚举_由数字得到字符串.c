#include <stdio.h>

enum week
{
	monday=1,thesday,wednesday,thursday,friday,saturday,sunday
};

const char *weekdaystr[]=
{
	"monday","thesday","wednesday","thursday","friday","saturday","sunday"
};
int main()
{
	int num;
	scanf("%d",&num);
	enum week i;

	for( i = monday; i <=sunday; i++ )
	{
		if(i==num)
		{
			printf("%s",weekdaystr[(int)(i-1)]);

		}
	}
	return 0;
}


