#include <stdio.h>
#include <stdlib.h>

#define NUM 10

int main(void)
{
	//模仿整形变量；
	int *p = NULL;
	if( (p = malloc(8)) != NULL )
	{
		*p =4;
		printf("%p\t%d\n",p,*p);
	}

	//模仿数组分配空间;
	int *q;
	int i;
	q = malloc( NUM*sizeof(int));
	if( NULL != q)
	{
		for ( i = 0; i< NUM; i++ )
		{
			q[i] = NUM -i;	
		}
		for ( i = 0; i< NUM; i++ )
		{
			printf("%p\tq[%d]=%3d\n",&q[i],i,q[i]);	
		}
		printf("\n");
	}
	return 0;
}
