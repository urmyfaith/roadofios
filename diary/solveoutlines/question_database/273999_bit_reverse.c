#include <stdio.h>

int main(void)
{
    int num;
    scanf("%d",&num);
    //num = 0;
    //8+16+32 = 24+32=56
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
    //	printf("%d\n",1<<digit);
    //	reverse 3~5
    //	1111 1111
    //	1100 0111
    int temp = num;
    int bit_3,bit_4,bit_5;
    bit_3 = !(temp & (1<<3));
    bit_4 = !(temp & (1<<4));
    bit_5 = !(temp & (1<<5));
    temp = num & 0xFFFFFFFFFFC7;
    num = temp + (bit_3<<3) + (bit_4<<4) + (bit_5<<5);
    printf("%d",num);
    return 0;
}

