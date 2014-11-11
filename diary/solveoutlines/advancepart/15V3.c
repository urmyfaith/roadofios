#include <stdio.h>


void delete_pos_in_array( int *p, int size, int pos);

int main()
{
	int num;

	printf("intput size of array:\n");
	scanf("%d",&num);
	int array[num];
	int i;
	int pos;

	printf("input array elements:\n");
	for (i = 0; i < num; i++ )
		scanf("%d",&array[i]);		

	printf("input pos to delete:\n");
	scanf("%d",&pos);		

	
	delete_pos_in_array( array,num,pos);

	for (i = 0; i < num; i++ )	
		printf("%3d",array[i]);
	printf("\n");


	return 0;
}

/*
 *	删除数组中的某个位置的元素，其他元素前移。
 *   后面的覆盖前面的数组，最后一位赋值为0；
 *   从插入的位置开始，后面的数覆前面的数 p[i] = p[i+1];
 *   两个需要注意的：1.边界  2.下标不能越界
 *    1 2 3 4 5 
 *    1 3 4 5 0
 *    0 1 2 3 4  下标
 * */
void delete_pos_in_array( int *p, int size, int pos)
{
#if 0
	int i;

	for ( i = pos-1; i < size - 1 ; i++ ) // 删除第2个位置，后面的有N-2个元素需要前移动。
	{
		p[i] = p[i+1];
	}
	p[size-1] = 0;
#endif
#if 0
	// 如果不使用q的时候，怎么确定循环的次数？
	int *q = p;

	for (p = p + (pos-1); p < q + (size -1) ; p++)
	{
		*p = *(p+1);
	}
	*p = 0;
#endif
	p = p + (pos-1);
	while(size-pos) //如果size=5，pos=2，那么需要移动三次。即为循环的次数位3 = size-pos;
	{
		*p = *(p+1);
		p++;
		pos++;
	}
	*p = 0;
		
}
