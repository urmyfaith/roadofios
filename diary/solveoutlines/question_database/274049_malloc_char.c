//从堆空间中申请一个字符型数据存储空间，
//从键盘赋值，然后输出
#include <stdio.h>
#include <stdlib.h>

int main()
{
	char *p = NULL;
	p = (char *) malloc(sizeof(char));
	if( p== NULL )
	{
		printf("malloc memory failed!");
		return 0;
	}
	*p = getchar();
	putchar(*p);

	return 0;
}
