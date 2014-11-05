#include <stdio.h>

int main()
{
	int i,j;

	for(i=1;i<100;i++)
	{

		printf("%d+%d=%d\n",i,i+1,(i+(i+1)));
	}
    
	return 0;
}
