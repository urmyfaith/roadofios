#include <stdio.h>
#define NUM 10

int my_strcmp(const char *p ,const char *q);


int main()
{
	
	printf("abc - abcd %d\n",my_strcmp("abc","abcd")); //a<b
	printf("abcd -abcd %d\n",my_strcmp("abcd","abcd"));//a=b
	printf("abcd - abc %d\n",my_strcmp("abcd","abc"));//a>b
	return 0;
}

int my_strcmp(const char *p ,const char *q)
{
	while( *p==*q )
	{
		if(*p++==0)
		{
			return 0;
		}
		q++;
	}
	return *p-*q;
}
