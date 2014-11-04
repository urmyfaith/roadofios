#include<stdio.h>

int main()
{
	float a=0,b=0;
	printf("calculate area of square which permiter a and the area of circle whose radius b\n");
	printf("please input a,b\n");
	scanf("%f,%f",&a,&b);
	//(a/4)*(a/4)
	if((a/4)*(a/4) > (3.14*b*b))
		printf("area square %.2f >area circle %.2f",((a/4)*(a/4)), (3.14*b*b) );
	else
		printf("area square %.2f <area circle %.2f",((a/4)*(a/4)), (3.14*b*b) );
	return 0;
}

#if 0
#endif
