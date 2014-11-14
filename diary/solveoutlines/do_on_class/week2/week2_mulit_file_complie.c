#include <stdio.h>

int main()
{
	printf("This file is \t%s\n",__FILE__);
	printf("The date is \t%s\n",__DATE__);
	printf("The time is \t%s\n",__TIME__);
	printf("This funciton is \t%s\n",__func__);
	return 0;
}
