#include <stdio.h>

#define NUM 6

int main()
{	
	char array[NUM]="abcGGG";
	int i;

	for( i = 0; i < NUM; i++)
	{
		if( array[i] >= 'a' && array[i] <= 'z' )
		{
			array[i] = array[i] - 32;
		}
		else

			if( array[i] >= 'A' && array[i] <= 'Z' )
			{
				array[i] = array[i] + 32;
			}
	}
	puts(array);
	return 0;
}
