#include <stdio.h>

char * my_strcpy(char *s1,const char *s2);

int main()
{
	char s2[10]={"my_strcpy"};
	char s1[10]={};
	char *p = NULL;

	p = my_strcpy(s1,s2);

	puts(s1);

	return 0;
}
char * my_strcpy(char *s1,const char *s2)
{
	char *temp=s1;
	while( '\0' != *s2 )
	{
		*s1 = *s2;
		s2++;
		s1++;
	}
	*s1 = '\0';
	return temp;
}
