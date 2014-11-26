#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int sumOfNumbersInString(const char * str)
{
    //上面代码不要动
    //your code...
    
    //连续的数字放入数组；
    //最后遍历数组输出和。
    
    int i=0,j=0,k=0;
    char *sum[10]={};
    int reback=0;
    char *p = (char *) malloc(sizeof(char));
    strcpy(p,str);
    // puts(p);
    
    //连续的数字放入数组
    while(p[i]!='\0')
    {
        if(sum[j]==NULL)
            sum[j]=(char *)malloc(sizeof(char));
        if(p[i]>='0' && p[i]<='9')//如果是数字，存入数组
        {
            // printf("%c\n",p[i]);
            sum[j][k]=p[i];
            k++;
        }
        else//如果不是，结束当前的数字进入数组。
        {
            sum[j][k]='\0';
            j++;
            k=0;
        }
        i++;
    }
    for( ;j>=0;j--)
    {
        // puts(sum[j]);
        reback += atoi(sum[j]);
    }
    
    return reback;
    
    //下面代码不要动
}

int main(void)
{
    char array[100]="a12b34c56";
    printf("%d",sumOfNumbersInString(array));
    return 0;
}
