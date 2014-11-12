#include <stdio.h>

#define NUM 1024

//void my_strcpy(char *dst,char *str);

char *  my_strcpy(char *dst,char *str);
	
int main(void)
{
	char str[NUM]={};
	my_strcpy(str,"hello world!");
	puts(str);

	return 0;
}
#if 0
void my_strcpy(char *dst,char *str)
{
	while( '\0' != *str)
	{
		*dst = *str;
		str++;
		dst++;
	}
	*dst = '\0';
}
#endif

char *  my_strcpy(char *dst,char *str)
{
	char *destination = dst;
	while( '\0' != *str)
	{
		*dst = *str;
		str++;
		dst++;
	}
	*dst = '\0';
	return destination;
}
