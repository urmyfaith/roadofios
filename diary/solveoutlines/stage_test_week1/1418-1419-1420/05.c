#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define NUM 1024

char char_to_lowercase(char ch);
int is_uppercase_or_lowercase(char ch);
void separateString(const char *str);

int main(void)
{
    
    char arr[NUM]="HELLOmyDEARword";
    separateString(arr);
    return 0;
}


//如果大小写发生翻转，插入空格
//大小写翻转的标志是flag变化
void separateString(const char *str)
{
    int flag;
    int i=0,k=1,len=(int)strlen(str);
    char *p = (char *)malloc(2*len*sizeof(char));
    
    flag = is_uppercase_or_lowercase(str[i]);
    *p=str[0];
    for( i = 1; i < len; i++ )
    {
        if(flag != is_uppercase_or_lowercase(str[i]))
        {
            flag = is_uppercase_or_lowercase(str[i]);
            p[k++] = ' ';
        }
        p[k++] = char_to_lowercase(str[i]);
    }
    p[k]='\0';
    puts(p);
	free(p);
	p=NULL;
}
int is_uppercase_or_lowercase(char ch)
{
    //lowcase 1
    //uppercase -1
    //others 0
    if(ch>='a' && ch<='z')
        return 1;
    if(ch>='A' && ch<='Z')
        return -1;
    return 0;
}
char char_to_lowercase(char ch)
{
    if(ch>='a' && ch<='z')
        return ch;
    if(ch>='A' && ch<='Z')
        return ch+32;
    return 0;
}
