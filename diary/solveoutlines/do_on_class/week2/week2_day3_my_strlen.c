#include <stdio.h>

#define NUM 1024

unsigned long my_strlen(const char *s);

int main(void)
{
	char str[NUM] = {};
	int i = 0;
	while((str[i] = getchar()) != '\n')
	{
		i++;
	}
	str[i] = '\0';

	puts(str);
	
	printf("%lu\n",my_strlen(str));

	return 0;
}
unsigned long my_strlen(const char *s)
{
	unsigned long count = 0;
	while( '\0' != *s)
	{
		count += 1;
		s++;
	}
	return count;
}
