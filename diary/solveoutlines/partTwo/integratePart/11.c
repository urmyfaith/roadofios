#include <stdio.h>

int main()
{
	int i;
	int power_down,power_index;
	int result;

	result = 1;
	power_down = 2;
	power_index = 20;

	for(i=1;i<=power_index;i++)
	{
		result = result * power_down  ;
	}

	printf("%d^%d=%d",power_down,power_index,result);
	
	return 0;
}
