#include <stdio.h>

int main(void)
{
	int num,digit;
	scanf("%d",&num);
	scanf("%d",&digit);
	// 0000 0000
	// 0010 0000
	//   2^5= 32
	printf("%d",(num>>digit)&1);
	return 0;
}
