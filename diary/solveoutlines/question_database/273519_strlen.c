/*定义一个比较大的字符数组，输入一个字符串保存到数组中，
 * 利用字符串处理函数获取字符串的长度并输出。
 * 比如：
 * 输入：abcdefg
 * 输出：7
 * */
#include <stdio.h>
#include <string.h>

#define NUM 1024

int main(void)
{
	char array[NUM]={};
	int i=0;
	while( (array[i] = getchar()) != '\n' )
		i++;	
	array[i]='\0';
	
	printf("%ld",strlen(array));
	
	return 0;
}



