//从键盘输入一个只包含0和1的二进制数字串（字符串不超过32位），
//然后把这个字符串所表示的二进制数转换成十进制数，并输出。
#include <stdio.h>
#include <string.h>

#define NUM 1024

int main()
{
    int i=0,len,sum=0;
    
#if 1
    char array[NUM] = {};
    while( ( array[i] = getchar() ) != '\n' && ( array[i] != ' ') )
        i++;
    
    array[i]='\0';
#endif
#if 0
    char array[NUM]="1001";
#endif
    len = (int)strlen(array);
    for ( i = 0; i < len; i++ )
    {
        sum += ((array[i] - '0')<<(len-i-1));
        // printf("%d",sum);
    }
    printf("%d",sum);
    return 0;
}

