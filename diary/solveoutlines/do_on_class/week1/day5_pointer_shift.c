#include<stdio.h>

int main(void)
{
    char ch;
    int num;
    double size;
    
    char *p1 = &ch;
    int *p2 = &num;
    double *p3 = &size;
    
    printf("%p %p %p\n",p1,p1+1,p1-1);
    printf("%p %p %p\n",p2,p2+1,p2-1);
    printf("%p %p %p\n",p3,p3+1,p3-1);
    
    return 0;	
}


