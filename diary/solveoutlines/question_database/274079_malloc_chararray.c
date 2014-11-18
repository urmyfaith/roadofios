//从堆空间中申请一个用来存放字符串的存储空间，
//从键盘赋值，然后输出。
#include <stdio.h>
#include <stdlib.h>

#define NUM 200

int main(void)
{
	char *p=NULL;
	int i = 0;
	p = (char *) malloc(sizeof(char)*NUM);

	if( p == NULL )
	{
		printf("malloc memory failed!");
		return 0;
	}
	
	while( (p[i] = getchar()) != '\n' )
		i++;
	p[i]= '\0';

	puts(p);

	free(p);
	p = NULL;
	return 0;
}
