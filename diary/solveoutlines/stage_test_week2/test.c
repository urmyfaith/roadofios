#include <stdio.h>

int main()
{
	char str[3]="abc";
	int i;
	for(i=0;i<5;i++)
	{
		printf("str[%d]=%c\n",i,str[i]);
	}
	return 0;
}
