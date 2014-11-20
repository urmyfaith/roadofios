#include <stdio.h>
#include <string.h>

char *lastStrStr(const char *s1,const char *s2);

int main(void)
{
	char *sbig = "the past was one the future ";
	char *ssmall = "this";
	
	puts(lastStrStr(sbig,ssmall));
	return 0;
}

char *lastStrStr(const char *s1,const char *s2)
{
	// char *p = s1 //不可以这么干，警告：const char * ==> char *
	char *p = strstr(s1,s2);
	char *q = p;
	
	while( (p=strstr(s1,s2)) != NULL )
	{
		s1++;
		q=p;
	}
	return q;
}
