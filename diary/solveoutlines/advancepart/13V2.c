#include <stdio.h>

void reverse_array( int *p,int size)
{
	//数组array
	int i;
	int temp;
#if 0
	for(i = 0; i < size; i++)
		printf("%3d",*(p+i) );
	printf("end of pointer \n");
#endif

	for ( i = 0; i <= size/2 ;i++)
	{
#if 0
		temp = p[i];
		p[i] =  p[size-1 -i];
		p[size-1 -i] = temp;
#endif
		;
// 这里后面的必须使用括号括起来。

#if 1
		temp = *(p+i);
		*(p+i) = *(p+(size-1-i));
		*(p+(size-1-i)) = temp;
#endif
	}
	return ;
}

#define NUM 5

int main()
{
	int array[NUM] = {1,2,3,4,5};
	int i;

	for ( i = 0; i < NUM; i++ )
	{
		printf("%3d",array[i]);
	}
	printf("\n");

	reverse_array(array,NUM);
	for ( i = 0; i < NUM; i++ )
	{
		printf("%3d",array[i]);
	}
	printf("\n");
	return 0;
}
