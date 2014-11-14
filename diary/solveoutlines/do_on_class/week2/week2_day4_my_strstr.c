#include <stdio.h>

#include <string.h>

#define NUM 30

int count_min_in_max(char *max,char *min);

int main(void)
{
	char max[NUM]="abc def abc def";
	char min[NUM]="def";

	printf("%p\n",strstr(max,min));

	printf("%d\n",count_min_in_max(max,min));
	return 0;
}
/*
 * strstr finded    pointerToPos //返回值是指向发现的地址；
 *		  not		null;
*/
int count_min_in_max(char *max,char *min)
{
	int count=0;
	char *max_temp = max;

	while( NULL != ( max_temp=strstr(max_temp,min) ) )
	{
		max_temp = max_temp + 1;
		count++;
	}

	return count;
}
