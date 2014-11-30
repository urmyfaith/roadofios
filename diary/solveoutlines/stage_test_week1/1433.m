#include "stdio.h"
#include "string.h"
#include "stdlib.h"

#define N 1024
int countNum(const char *str,const char *s,int len);
int checkA(const char *str,const char *s,int len);
void compressString(const char *str);
void withoutSpaceInString(char *str);

int main(void)
{
    int i=0;
    char str[N];
    while((str[i]=getchar())!='\n')i++;
    str[i]='\0';
    //compressString(str);
    //puts(str);
    withoutSpaceInString(str);
}
void sortArray(int *array,int ascOrDesc,int length)
{
    
}
void withoutSpaceInString(char *str)
{
    char q[N]={};
    while((str=(strtok(str," ")))!=NULL)
    {
        strcat(q,str);
        str=NULL;
    }
    puts(q);
}
void compressString(const char *str)
{
    int i,count;
    char str1[N];
    char str2[N];
    int k=0;
    int n=0;
    for(i=0;str[i]!='\0';i++)
    {
        if(!checkA(str, &str[i], i))
        {
            str2[n++]=str[i];
            count=countNum(str, &str[i], i);
            for(int j=0;j<count;j++)
            {
                str1[k++]=str[i];
            }
            str2[n++]=count+'0';
            printf("%c%d",str[i],count);
        }
    }
//    printf("\n");
//    for(i=0;i<=k;i++)
//    {
//        printf("%c| ",str1[i]);
//    }
//        printf("\n");
//    for(i=0;i<=n;i++)
//    {
//        printf("%c| ",str2[i]);
//    }
    printf("\n");
    str1[k]='\0';
    str2[n]='\0';
    puts(str1);
    puts(str2);
}

int checkA(const char *str,const char *s,int len)
{
    int i,flag=0;
    for(i=0;i<len;i++)
    {
        if(str[i]==*s)
        {
            flag=1;
            break;
        }
        else
        {
            flag=0;
        }
    }
    return flag;
}

int countNum(const char *str,const char *s,int len)
{
    int i,count=0;
    for(i=len;str[i]!='\0';i++)
    {
        if(str[i]==*s)count++;
    }
    return count;
}