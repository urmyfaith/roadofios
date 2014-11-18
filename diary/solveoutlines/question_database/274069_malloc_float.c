//从堆空间中申请一个单精度浮点型数据存储空间，
//从键盘赋值，然后输出（保留两位小数）
#include <stdio.h>
#include <stdlib.h>

int main()
{
	float *p = NULL;
	p = (float *) malloc(sizeof(char));
	if( p== NULL )
	{
		printf("malloc memory failed!");
		return 0;
	}
	scanf("%f",p);
	printf("%.2f",*p);

	return 0;
}
