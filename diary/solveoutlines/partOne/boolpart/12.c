#include<stdio.h>

int main()
{
	int num,i;
	int flag=1;

	printf("please input a num:\n");
	scanf("%d",&num);

	for(i=2;i<num;i++)
	{
		if(num%i==0)
		{
			flag =0;
			break;
		}
	}
	if(flag)
		printf("num(%d) is a prime!",num);
	else
		printf("num(%d) is a not a  prime!",num);
	return 0;
}	

#if 0
#endif
