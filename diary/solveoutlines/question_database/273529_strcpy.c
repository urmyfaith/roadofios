/*定义两个元素个数相同的字符数组，
 * 输入一个字符串保存到数组中，
 * 利用字符串处理函数将第一个数组中的内容复制到第二个数组中，
 * 并将两个数组中的内容分别输出。
 * 比如：
 * 输入：abcdefg
 * 输出：
 * abcdefg
 * abcdefg*/
#include <stdio.h>
#include <string.h>

#define NUM 1024

int main(void)
{
	char src[NUM];
	char dst[NUM];
	int i = 0;

	while ( ( src[i] = getchar() ) != '\n' )
		i++;
	src[i]='\0';

	strcpy(dst,src);
	puts(src);
	puts(dst);

	return 0;
}

