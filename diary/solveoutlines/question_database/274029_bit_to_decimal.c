//从键盘输入一个整型数（int型），然后再输入两个数字n和m，
//把第一个数的第n（从0开始）位到第m位抽取出来,
//构成一个新的数按整型十进制输出；（不要超出范围）

// 15 = 1111 = 8 +4+2+1;
// 0000 1111
//      111
//170 4 7 = 0xAA= 1010
//170 = 128+32+8+2=   1010 1010;
//					  1010

#include <stdio.h>

int main()
{
    int num,n,m,i;
    int sum = 0,temp = 0;
#if 0
    num = 170,n=4,m=7;
    //num = 15,n=1,m=3;
#endif
    
#if 1
    scanf("%d",&num);
    scanf("%d",&n);
    scanf("%d",&m);
#endif
    for( i = m; i>= n; i-- )
    {
        
        temp =(num>>i) &1;//取出最高位
        
        sum = (sum<<1)+temp;  //最高位左移
        // printf("%d",sum);
    }
    
    printf("%d",sum);
    return 0;
}
