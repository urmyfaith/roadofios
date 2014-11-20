#include <stdio.h>

#define NUM 10

struct demo
{
	int n;
};

int main()
{
	struct demo arr[NUM];
	int i,j,flag,temp_n;
//	char temp_c;

	//初始化
	for ( i = 0; i < NUM; i++ )
	{
		scanf("%d",&arr[i].n);
		//while( ( arr[i].c = getchar() ) == ' ' || arr[i].c == '\n' )
		//	;
	}

	//选择排序
	for( i = NUM-1; i >=0; i-- )
	{
		flag = i;
		for ( j = 0; j < i; j++ )
		{
			if ( arr[flag].n < arr[j].n )
			{
				flag = j;
			}
		}
		if( flag != i )
		{
			temp_n = arr[flag].n;
		//	temp_c = arr[flag].c;

			arr[flag].n = arr[i].n;
//			arr[flag].c = arr[i].c;

			arr[i].n = temp_n;
//			arr[i].c = temp_c;
		}
	}
	//output
	for ( i = 0; i< NUM; i++ )
	{
		printf("%d ",arr[i].n);
		//printf("%d%c ",arr[i].n,arr[i].c);
	}


	return 0;
}
