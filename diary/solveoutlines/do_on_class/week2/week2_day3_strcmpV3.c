#include<stdio.h>


int my_strcmp(char *s1,char *s2);

int main(void)
{
    printf("abc - abcd %d\n",my_strcmp("abc","abcd")); //a<b
    printf("abcd -abcd %d\n",my_strcmp("abcd","abcd"));//a=b
    printf("abcd - abc %d\n",my_strcmp("abcd","abc"));//a>b
    
    
    return 0;
}

int my_strcmp(char *s1,char *s2)
{
#if 0
    while(*s1==*s2) {
        if(*s1=='\0'&&*s2=='\0')
            break;
        s1++;
        s2++;
    }
    return *s1-*s2;
#else
    while(*s1++==*s2++) {
        if(*(s1-1)=='\0')
            break;
    }
    return *(s1-1)-*(s2-1);
#endif
}



