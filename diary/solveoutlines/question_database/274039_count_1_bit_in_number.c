//从键盘输入一个整型数（int型），输出这个整型数中有多少个1；

#include <stdio.h>

int main(void)
{
    int num;
    int i,count = 0;
#if 1
    scanf("%d",&num);
#endif
#if 0
    num = 7;
#endif
    
    for ( i = 0; i< 32; i++)
    {
        if (  ( (num>>i) & 1) == 1 )
            count++;
    }
    printf("%d",count);
    
    return 0;
}
