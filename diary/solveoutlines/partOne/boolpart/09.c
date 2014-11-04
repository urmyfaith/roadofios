#include<stdio.h>

int main()
{
	int num;
	printf("please intput a integer:\n");
	scanf("%d",&num);
	if((num%10>=3) && (num%10<=8))
		printf("3<=num(%d)<=8",num%10);
	else
		printf("3<=num(%d)<=8 NOT satisfy!",num%10);
	return 0;
}

#if 0
#endif
