#include <stdio.h>

int main()
{
	char string_array[1024] ="123fdd";
	int i,count_number = 0,count_char = 0;
		
	for( i = 0; string_array[i] != '\0' ; i++)
	{
		char e = string_array[i];
		if( (e>='a' && e<='z') || (e>='A' && e<='Z'))
			count_char += 1;
		if( e>='0' && e<='9')
			count_number += 1;
		printf("%c",e);
	}
	printf("\nchar counts:%d\tnunber counts:%d",count_number,count_char);
	return 0;	
}
