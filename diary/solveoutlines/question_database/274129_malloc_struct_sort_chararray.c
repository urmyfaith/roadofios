#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define NUM 10
#define LEN 10

struct N
{
	char name[LEN];
};

int main(void)
{
	struct N n[NUM];
	int i,j,flag;
	char *temp = (char *) malloc(sizeof(char)*LEN);
	for ( i = 0 ; i < NUM; i++ )
	{
		j =0;

		while (
				 ((n[i].name)[j] = getchar() ) != ' ' &&
			      (n[i].name)[j] != '\n'
		    	)
		{
			j++;
		}
		(n[i].name)[j]='\0';
	}

#if 0
	for ( i = 0; i < NUM; i++ )
	{
		puts(n[i].name);
	}
#endif

	//默认第一个数最大
	//把这个数和其它数比较，如果其他数比它大，记录下标；
	//如果下标和第一个数不同，交换
	
	for( i = NUM-1; i>=0; i-- )
	{
		flag =i;
		for( j = 0; j<i; j++ )
		{
			if( strcmp(n[flag].name,n[j].name) < 0 )
			{
				flag = j;
			}
		}
		if(flag != i)
		{
		//	temp = n[flag].name;
		//	n[flag].name = n[j].name;
		//	n[j].name = temp;
			strcpy(temp,n[flag].name);
			strcpy(n[flag].name,n[j].name);
			strcpy(n[j].name,temp);
		}
	}

	for ( i = 0; i < NUM; i++ )
	{
		puts(n[i].name);
	}





	return 0;	
}
