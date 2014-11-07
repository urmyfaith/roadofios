#include <stdio.h>

#define MAX 1024
#define MIN 100

int main()
{
	char array_max[MAX] = "abc";
	char array_min[MIN] = "def";

	char *p_max = array_max;
	char *p_min = array_min;

	while( '\0' != *p_max )
	{	
		p_max++	;
	}

	while( '\0' != *p_min)
	{
		*p_max = *p_min; //赋值；
		p_max++ ;
		p_min++ ;
	}

	// a b c 1 2 3 '\0'
	//			  p_min
	//			  p_max
	*p_max = '\0';
	
	//puts(array_max);
	
}

// a b c \0
//		 p_max
