#include<stdio.h>
#include<string.h>
#define NUM 5
int main(void)
{
    char *p[NUM]={};
    int i,j;
    char *tmp;
    
    p[0]="Tom";
    p[1]="Kate";
    p[2]="Jerry";
    p[3]="Jack";
    p[4]="Rose";
    
    for(i=0; i<NUM; i++) {
        puts(p[i]);
    }
    printf("\n");
    for(i=1; i<NUM; i++) {
        tmp=p[i];
        for(j=i-1; j>=0; j--) {
            if(strcmp(p[j],tmp)>0)
                p[j+1]=p[j];
            else
                break;
        }
        p[j+1]=tmp;
    }
    
    for(i=0; i<NUM; i++) {
        puts(p[i]);
    }
    return 0;
}


// 指针数组
// 插入排序
// strcmp的实现。



