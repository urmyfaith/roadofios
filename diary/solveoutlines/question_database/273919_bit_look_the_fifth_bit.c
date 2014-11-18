#include <stdio.h>

int main(void)
{
	int num;
	scanf("%d",&num);
	// 0000 0000
	// 0010 0000
	//   2^5= 32
	printf("%d",(num>>5)&1);
	return 0;
}
