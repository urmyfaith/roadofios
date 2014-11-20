////2.实现函数，传入一个字符串，返回英语字母出现的次数(15)
////str 字符串参数
////返回值是英语字母个数
//
//

#include<stdio.h>
#include<stdlib.h>
#include<string.h>

#define LEN 100

int countOfAlphaInString(const char * str);

int main(void)
{
    char array[LEN]={};
    int i=0;
    
    while( (array[i]=getchar()) != '\n' )
        i++;
    array[i]='\0';
    
	printf("%d",countOfAlphaInString(array));
    return 0;
}

int countOfAlphaInString(const char * str)
{
    int count =0;
    char *p = (char *) malloc(sizeof(char));
    strcpy(p,str);
    while(  *p != '\0')
    {
        if( (*p>='a' && *p <= 'z') ||
           (*p>='A' && *p <= 'Z') )
            count++;
        p++;
    }
    return count;
}
