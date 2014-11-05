#include <stdio.h>

int main()
{
	int n;
	int i,j;
	float sum = 0;
	float temp =0;
	
	scanf("%d",&n);
	for(i = 1; i <= n; i++)
	{
		for(j = 1; j <=i;j++)
		{
			temp = temp  + j;
			//printf("temp = %f\n",temp);
		}
		//printf("temp = %f\n",temp);
		temp = 1.0 / temp;
		sum = sum + temp ;
		temp = 0;
	}
	printf("\nGiven n= %d\n",n);
	printf("S=1+1/(1+2)+...+1/(1+2+3+..+n)=%f\n",sum);
	return 0;
}
