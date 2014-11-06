#include <stdio.h>

#define NUM 10


int main(void)
{
	int  arrayA[NUM] = {1,2,3};
	int  arrayB[NUM] = {};
	int i;

	for ( i = 0 ; '\0' != arrayA[i] ; i++ )
	{
		arrayB[i] = arrayA[i];
	}
	arrayB[i] = '\0';

	for ( i = 0; '\0' != arrayB[i]; i++)
		printf("arrayB[%d]=%d\n",i,arrayB[i]);

	return 0;
}
