//第n位到第m位翻转并输出；

#include <stdio.h>

int main(void)
{
    int num,n,m;
    scanf("%d",&num);
    scanf("%d",&n);
    scanf("%d",&m);
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
    int sum = 0,clear_bit=0;
    int i;
    for ( i = n; i<= m ; i++ )
    {
        sum += (!(num&(1<<i))<<i);
        clear_bit += (1<<i);
    }
    num = num & (0xFFFFFFFFFFFF- clear_bit);
    num = num + sum; //清零后的值+取反部分的值
#if 0
    int bit_3,bit_4,bit_5;
    bit_3 = !(temp & (1<<3));
    bit_4 = !(temp & (1<<4));
    bit_5 = !(temp & (1<<5));
    temp = num & 0xFFFFFFFFFFC7;
    num = temp + (bit_3<<3) + (bit_4<<4) + (bit_5<<5);
#endif
    printf("%d",num);
    return 0;
}
