#include <stdio.h>

int my_str_length(const char *p);
int count_char_in_str(const char *p,char which_char);
char * delete_a_char_in_str(char *p,int str_length,char delete_char);
char find_the_first_only_one_char( const char *p);
int main()
{
    char str[10]="ababcdcef";
    printf("%c",find_the_first_only_one_char(str));
    return 0;
}

//如果出现字符数大于1的，将这个字符从数组中删除；
//返回出现字符数为1的元素；

char find_the_first_only_one_char( const char *p)
{
    
    char *q = (char *)p;
    int length;
    while (1)
    {
        length = my_str_length(q);
        
        if ( count_char_in_str(q, q[0]) >1 )
        {
            q = delete_a_char_in_str(q,length,q[0]);
        }
        else
        {
            return q[0];
        }
        
    }
    return q[0];
    
}

//对给定的字符，从字符数组里删除所有出现的。
//如果字符数出现大于0，继续删除
//返回删除后的数组；

char * delete_a_char_in_str(char *p,int str_length,char delete_char)
{
    
    int i,j;
    char *q=p;
    int length;
    
    while (count_char_in_str(q,delete_char))
    {
        length=my_str_length(q);
        for(i=0;i<length;i++)
        {
            if(q[i]==delete_char)
            {
                for (j = i; j<length-1; j++)
                {
                    q[j]=q[j+1];
                }
                q[length-1]='\0';
            }
        }
    }
    return q;
    
}

int count_char_in_str(const char *p,char which_char)
{
    int count =0;
    while(*p)
    {
        if(*p==which_char)
        {
            count++;
        }
        p++;
    }
    return count;
}



int my_str_length(const char *p)
{
    int count=0;
    while(*p)
    {
        count +=1;
        p++;
    }
    return count;
}
