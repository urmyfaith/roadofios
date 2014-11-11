#include <stdio.h>

void even_old_sort(int *p,int size);
void select_sort(int *p,int size);

int main()
{
	int num = 10;
	int array[num];
	int i;

	printf("input 10 numbers:\n");
	for ( i = 0; i < num ; i++ )
	{
		scanf("%d",&array[i]);
	}

	even_old_sort(array,num);
	for ( i =0; i < num; i++ )
	{
		printf("%3d",array[i]);
	}
	printf("\n");

	return 0;
}

// 0 1 2 3 4 5 6 7 8 9   下标
// 1 3 2 5 4 7 6 9 8 10  原始数组
// 1 2 3 4 5 6 7 8 9 10  排序后的数组
// 1 3 5 7 9 2 4 6 8 10
//  创建临时数组，奇数先入数组，然后偶数进入数组。
// 最后拷贝临时数组，覆盖原有数组。
void even_old_sort(int *p,int size)
{
    //首先将数组排序位有序数组；
	int temp[size];
	int *q = temp;
	int i;

    select_sort(p,size);
	for( i = 0; i< size ; i++)
	{
		if( p[i]%2 != 0 )
		{
			*q = p[i];
			q++;
		}
	}
	for( i = 0; i< size ; i++)
	{
		if( p[i]%2 == 0 )
		{
			*q = p[i];
			q++;
		}
	}
	q =  temp;
	for ( i = 0; i< size; i++ )
	{
		p[i] = q[i];
	}
#if 0
    int i;
    for ( i = 0; i < size; i++)
    {
        //
        if
            }
#endif
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
            if(array[flag] > array[j])
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
