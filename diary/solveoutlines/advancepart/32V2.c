#include <stdio.h>

#define NUM 8

void test__count_number_in_array();
int count_number_in_array(int *q,int size,int num);
void print_last_ele_in_array(int *p,int n,int pos);
void printf_array(int *p,int n);

int main(void)
{
    int array[NUM]={};
    int i;
    for ( i = 0; i < NUM; i++)
        array[i] = i;
    int m;
    printf("input m:\n");
    //scanf("%d",&m);
    m=3;
    print_last_ele_in_array( array,NUM,m );

    return 0;
}

void print_last_ele_in_array(int *p,int n,int pos)
{
    int i;
    int array[NUM]={}; //数组初始化为0；
    int *temp = array;
    int *q=array;
	int temp_pos = pos;
    
		//跳过1个0， 
		//指向第2个0	
		//标记第2个0为1		==>找到第二个0，标记为1
		//指向第3个0；		==>
    while( count_number_in_array(q,NUM,0) > 1)
    {
		// m = 3的时候；
		// m = 4
		for(i=0;i<m-2;i++)
		{
			if(*(q+1)==0)
				q++;
		}
		if(*(q+1)==0)
		{
			q++;
			*q = 1;
		}
		if(*(*q+1==0))
			q++;
    }
	
	i=0;
	while(p[i]==1)
	{
		i++;
	}
    printf("%d\n",p[i]);
}
void printf_array(int *p,int n)
{
	int i=0;
	printf("--------\n");
	for(i=0;i<n;i++)
	{
		printf("%d\t",p[i]);
	}
	printf("\n");
}

int count_number_in_array(int *q,int size,int num)
{
    int i,count=0;
    
    for ( i = 0; i < size; i++ )
    {
        if( q[i] == num )
        {
            count++;
        }
    }
    return count;
}


