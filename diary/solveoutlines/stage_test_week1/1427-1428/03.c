#include <stdio.h>
#include <string.h>
#include <stdlib.h>

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
	int i;
	char *pos = (char *)malloc(sizeof(char));
	while(strstr(s1,s2)!=NULL)
	{
		strcpy(pos,s1);
		s1++;
	}
	return pos;
}
