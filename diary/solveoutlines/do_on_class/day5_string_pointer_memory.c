#include <stdio.h>

//常量字符串存储在静态存储区i；
#define NUM 10
int main(void)
{
    
    //常量字符串本身是这个字符串的地址；
    //对地址*，取值。
    //然后地址偏移，取值。
    //最后还有一个字符串结束标志，‘\0’;
    int a = 0;
    
    printf("%p,%c\n","abc",*"abc");
    printf("%p,%c\n","abc"+1,*("abc"+1));
    printf("%p,%c\n","abc"+2,*("abc"+2));
    
    printf("%p,%c\n","abc"+3,*("abc"+3));
    printf("%p,%d\n","abc"+3,*("abc"+3));
    
    char array[NUM]="def";
    char *p = "def";
    int i;
    
    for (i = 0; array[i] != '\0'; i++ )
    {
        printf("array[%d]\t%p,%c\n",i,&array[i],array[i]);
        
    }
    
    printf("&p=%p\n",&p);
    for (i = 0; p[i] != '\0'; i++ )
    {
        printf("(p+%d)\t%p,%c\n",i,p+i,*(p+i));
    }
    
    return 0;
}
#if 0
0x1067d0f86,a
0x1067d0f87,b
0x1067d0f88,c
0x1067d0f89,
0x1067d0f89,0

#endif
