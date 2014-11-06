#include <stdio.h>

int main()
{
	char string_array[1024] ="123fdd";
	int i,count;
		
	for( i = 0; string_array[i] != '\0' ; i++)
	{
		char e = string_array[i];
		if( (e>='a' && e<='z') || (e>='A' && e<='Z'))
			count += 1;
		printf("%c",e);
	}
	printf("\ncharacter in above string is :%d",count);
	return 0;	
}
