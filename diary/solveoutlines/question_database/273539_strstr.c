/*定义两个字符数组，
 * 分别输入两个字符串，
 * 利用字符串处理函数判断，
 * 字符串2在字符串1中是否存在,
 * 如果存在输出Y，
 * 否则输出N。
 * 比如：
 * 输入：
 * abcdefg
 * cde
 * 输出：
 * Y*/

#include <stdio.h>
#include <string.h>

#define NUM1 100
#define NUM2 10

int main(void)
{
	char s1[NUM1]={};
	char s2[NUM2]={};
	int i=0;
	while ( (s1[i] = getchar()) != '\n' )
		i++;
	s1[i]='\0';

	i = 0;
	while ( (s2[i] = getchar()) != '\n' )
		i++;
	s2[i]='\0';

	strstr(s1,s2) == NULL ? putchar('N') : putchar('Y');

	return 0;
}
