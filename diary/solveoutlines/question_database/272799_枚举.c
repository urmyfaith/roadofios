#include <stdio.h>

enum week
{
	MON,TUE,WEN,THU,FRI,SAT,SUN
};

int main()
{
	int num;
	scanf("%d",&num);
	enum week i;

	for( i = MON; i < num; i++ )
	{
		printf("%d ",i);
	}


	return 0;
}


