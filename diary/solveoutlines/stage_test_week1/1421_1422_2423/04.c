/*4.将字符中单词用空格隔开(15分)
 * 已知传入的字符串中只有字母，每个单词的首字母大写，请将每个单词用空格隔开
 * 只保留第一个单词的首字母大写
 *
 * 传入:"HelloMyWorld"
 *
 * 打印:"Hello my world"
 * */
#include <stdio.h>

#define LEN 100

int is_upper_case(char ch);
void separateString(const char *str);

int main(void)
{
	char arr[LEN]="HelloMyWord";
	separateString(arr);
	return 0;
}
void separateString(const char *str)
{
	int i;
	putchar(str[0]);
	for( i = 1; str[i] != '\0'; i++ )
	{
		if(is_upper_case(str[i]))
		{
			putchar(' ');
			putchar(str[i]+'a'-'A');
		}
		else
			putchar(str[i]);
	}
}

int is_upper_case(char ch)
{
	int flag=0;

	if( ch >= 'A' && ch <= 'Z') 
		flag =1;
	return flag;
}
