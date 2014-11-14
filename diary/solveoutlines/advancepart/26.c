// 数组A【n】，B【m】，已经排序，A中哪些元素在B数组中。

#include <stdio.h>

#define n 7
#define m 8


void find_a_in_b_stored_to_c(int *a,int a_size, int *b,int b_size,int *c);

int main()
{
	int a[n] = {1,3,5,6,7,9,10};
	int b[m] = {2,3,4,6,8,9,11,12};
	int c[n]={};
	int i;

	find_a_in_b_stored_to_c(a,n,b,m,c);

	for(i=0;c[i]!=0;i++)
	{
		printf("%d\t",c[i]);
	}
	printf("\n");


		
	return 0;
}

void find_a_in_b_stored_to_c(int *a,int a_size, int *b,int b_size,int *c)
{
	int i,j,k;

	for( i = 0; i < a_size; i++ )
	{
		for(j = 0; j < b_size; j++ )
		{
			if(a[i]<b[j])
			{
				//不在B中。
				break;
			}
			else if (a[i] == b[j])
			{
				c[k] = a[i];
				k++;
			}
		}
	}
}
