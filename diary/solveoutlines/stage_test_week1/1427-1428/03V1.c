#include <stdio.h>
#include <string.h>

char * lastStrStr(const char * s1, const char * s2);

int main(void)
{
	char *str_1 = "abcdef abccba";
	char *str_2 = "abc";
	char *str;
	str = lastStrStr(str_1,str_2);
	puts(str);

	return 0;
}
char * lastStrStr(const char *s1,const char *s2)
{
	char *pos;
	while(strstr(s1,s2)!=NULL)
	{
		pos = (char *)s1;
		s1++;
	}
	return pos;
}
