#include <stdio.h>

#define NUM_A 7

#define NUM_B 10

void find_two_number_in_array(int *p,int size,int find_num,int *q);
void select_sort(int *p,int size);
int find(int *p,int size,int find_num);
void delete( int *p ,int size,int delete_value);

// 给定数7 ，那么1，6，3，4
//
int main(void)
{
	int array[NUM_A]={1,3,4,5,6,7,8};
	int array_add[NUM_B] ={};
	int i;
	int num;
	printf("input the number c (a+b)\n");
	scanf("%d",&num);

	find_two_number_in_array(array,NUM_A,num,array_add);

	for( i = 0; i < NUM_B; i = i+2 )
	{
		if (array_add[i] != 0)
		{
			printf("%d+%d=%d\n",array_add[i],array_add[i+1],num);			
		}
	}

	return 0;
}

/*
 *	1 3 4 5 6 7 8  
 *  给定的数  7
 *  1        6
 *    3 4
 * */


// 先进行排序
// 取出一个数 a，剩余的数组成一个数组， ==> 从数组中删除一个数.
// 在剩下的数组中查找n-a
//
void find_two_number_in_array(int *p,int size,int find_num,int *q)
{
	int sub;
	int *p_copy = NULL;
	int another;
    select_sort(p,size);
	int i,temp;
	int j = 0;
	for ( i = 0; i < size -1 ; i++ )
	{
		p_copy = p+i;
		another = 0;

		temp = p_copy[0]; //取出一个数，	
		delete(p_copy,size-i,temp);	 //q删除了第i个元素 

		another = find( p_copy,size-i,find_num-temp);	//从数组q中查找find_num - temp;
		if ( temp + another == find_num)
		{
			delete(p_copy,size-i-1,another);
			q[j]=temp;
			q[j+1]=another;
			q++;
		}
	}
	
	
}

int find(int *p,int size,int find_num)
{
	int i;
	
	for (i = 0; i < size; i++)
	{
		if( p[i] == find_num )
		{
			return find_num;
		}
	}
	if(i==size)
		return 0;
	return 0;
}

// 1 3 4 5 6 7
// 1 3 x 5 6 7 
// 1 3 5 6 7 0
void delete( int *p ,int size,int delete_value )
{
	int *q = p;
	while( *q!= delete_value)
	{
		q++;
	}
	while( q < p + size-1 )   // q[size-2] =q[size-1];
	{
		*q = *(q+1);
		q++;
	}
	*q=0;
	p = q;
}

void select_sort(int *p,int size)
{
    int i,j;
    int NUM = size;
    int flag;
    int *array=p;
    int temp;
    
    for (i = 0; i < NUM-1; i++ )
    {
        flag = i;
        for ( j = i+1; j < NUM ; j++ )
        {
            if(array[flag] < array[j])
                flag = j;
            
        }
        if( flag != i)
        {
            temp = array[i];
            array[i] = array[flag];
            array[flag]= temp;
        }
    }
    return ;
}
