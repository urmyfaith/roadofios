#include <stdio.h>

int main()
{
	float max = 0,num;
	
	for(int i = 0;i < 5; i++)
	{
		scanf("%f",&num);
		max = max >num? max : num;
		num = 0;
	}
	printf("%f\n",max);

	return 0;
}

