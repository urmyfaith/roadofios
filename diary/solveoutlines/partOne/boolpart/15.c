#include<stdio.h>

int main()
{
	char a,b;
	printf("please input char a,b\n");
	scanf("%d,%d",&a,&b);
	
	if((a>47&&a<78)|| (b>47&&b<58))
		printf("YES,there is digit!");
	else
		printf("No,there is NO digit in a and b !");

	return 0;
}

#if 0
48 0
57 0
#endif
