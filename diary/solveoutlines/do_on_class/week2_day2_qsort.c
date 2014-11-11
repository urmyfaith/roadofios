#include <stdio.h>
#include <stdlib.h>

#define NUM  10
int my_compare(const void *p,const void *q);

int main(void)
{
	int arr[NUM] = { 4,8,0,3,1,7,5,9,6,2};
	for(int i=0;i<NUM;i++)
		printf("%5d",arr[i]);
	printf("\n");

	qsort(arr,NUM,sizeof(int),my_compare);

	for(int i=0;i<NUM;i++)
		printf("%5d",arr[i]);
	printf("\n");
	return 0;
}

int my_compare(const void *p,const void *q)
{
	const int *m = (const void *)p;
	const int *n = (const void *)q;
	return *m-*n;
#if 0
	if( *p > *q)
		return *p-*q;
	else
		if(*p == *q)
			return 0;
		slse
			teturn *p-*q;
#endif
}
