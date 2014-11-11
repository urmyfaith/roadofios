#include <stdio.h>

void count_number_times_in_array(int *p,int size,int *q);

int main()
{
	int array_size;
	printf("input array_size:\n");
	scanf("%d",&array_size);

	int array[array_size];
	int i;
	printf("input array element between 0~9.\n");
	for ( i = 0; i < array_size; i++ )
		scanf("%d",&array[i]);
	
	int number_count[9]={};
	count_number_times_in_array(array,array_size,number_count);
	for ( i= 0; i < 9; i++ )
	{
		if( number_count[i]!= 0 )
			printf("%d--->%3d  times\n",i+1,number_count[i]);
	}
	printf("\n");

	return 0;
}

void count_number_times_in_array(int *p,int size,int *q)
{
	int i;
	for( i = 0; i < size ; i++ )
	{
		switch(*(p+i))
		{
			case 1:
				q[0] += 1;
				break;
			case 2:
				q[1] += 1;
				break;
			case 3:
				q[2] += 1;
				break;
			case 4:
				q[3] += 1;
				break;
			case 5:
				q[4] += 1;
				break;
			case 6:
				q[5] += 1;
				break;
			case 7:
				q[6] += 1;
				break;
			case 8:
				q[7] += 1;
				break;
			case 9:
				q[8] += 1;
				break;
			default:
				printf("number between 0~9 !!!!\n");
				break;
		}
	}
}
