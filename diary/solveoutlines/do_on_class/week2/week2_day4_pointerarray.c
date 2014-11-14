#include <stdio.h>

#define NUM 3

int main(void)
{
	int arr[NUM][NUM]={
		{1,2,3},
		{4,5,6},
		{7,8,9}
	};
	int (*p)[NUM];
	int i,j;

	p = arr;

	for(i=0;i<NUM;i++)
	{
		for(j=0;j<NUM;j++)
			printf("%-5d",p[i][j]);
		printf("\n");
	}
	printf("p=%p\n",p);
	printf("p+1=%p\n",p+1);
	return 0;
}
