#include <stdio.h>

#define NUM 1024

char *my_strcat(char *dst,char *src);


//char * my_strcat(char * s, const char * append);

int main(void)
{
	char str[NUM]="we are the world!";
	my_strcat(str,"the past was once the future");
	puts(str);
	return 0;
}
#if 1
char *my_strcat(char *dst,char *src)
{
	char *dest = dst;
	while(*dst)
		dst++;
	while(*src)

#if 0
	while( '\0' != *dst)
		dst++;
	while( '\0' != *src)
#endif
	{
		*dst = *src;
		dst++;
		src++;
	}
	*dst = '\0';
	return dest;
}
#endif

#if 0
char * my_strcat(char * s, const char * append)
{
	char *save = s;

	for (; *s; ++s);
	while ((*s++ = *append++) != 0);
	return(save);
}
#endif
