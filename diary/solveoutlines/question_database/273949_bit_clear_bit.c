#include <stdio.h>

int main(void)
{
	int num,digit;
	scanf("%d",&num);
	scanf("%d",&digit);
	// -1
	// 0000 0000 0000 0001
	// 1000 0000 0000 0001原码
	// 1111 1111 1111 1110反码
	// 1111 1111 1111 1111补码
	//整数4个字节
	//64bit = 64bit /8bit/bytes = 8bytes;
	//48bit = 6bytes
	//FF FF FF FF FF FF FF FF
	// 1001
	printf("%d\n",1<<digit);
	printf("%d",num & (0xFFFFFFFFFFFF-(1<<digit)));
	return 0;
}
