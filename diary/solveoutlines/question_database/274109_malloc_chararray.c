//定义一个具有10个元素的字符数组，
//然后从键盘随机初始化这个数组，
//利用初始化过的字符串长度在堆中开辟一块空间，
//然后将数组中的内容复制到堆空间中，并输出堆空间的内容。

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define NUM 11

int main(void)
{
	char array[NUM]={};
	char *p = NULL;
	int i = 0,len;

	while( (array[i] = getchar()) != '\n' )
		i++;
	array[i]='\0';

	len=(int) strlen(array);
	p = (char *) malloc(sizeof(char)*len);

	for ( i = 0; i < len; i++ )
	{
		p[i] = array[i];
	}
	p[i]='\0';
	puts(p);

	free(p);
	p = NULL;

	return 0;
}
