#include <stdlib.h>
#include <stdio.h>
#include <time.h>
	
int main(void)
{
	int  i,temp;
	int seed = (int)time(NULL);
	srand(seed);

	for( i = 0; i < 10; i++ )
	{
		temp = rand();
		//printf("%d\n",temp);
		printf("%d\n",temp%10);
	}	
	return 0;
}
