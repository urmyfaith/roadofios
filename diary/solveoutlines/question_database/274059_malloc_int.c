//从堆空间中申请一个整型数据存储空间，
//从键盘赋值，然后输出。
#include <stdio.h>
#include <stdlib.h>

int main()
{
	int *p = NULL;
	p = (int *) malloc(sizeof(char));
	if( p== NULL )
	{
		printf("malloc memory failed!");
		return 0;
	}
	scanf("%d",p);
	printf("%d",*p);

	return 0;
}
