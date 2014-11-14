#include <stdio.h>

int my_str_length(const char *p);
int count_char_in_str(const char *p,char which_char);
char * delete_a_char_in_str(char *p,int str_length,char delete_char);
char * delete_ele_of_b_from_a(char *str_a,char *str_b);

int main()
{
    char str_a[30]="They are students.";
    char str_b[10]="aeiou";
    char *str_c = delete_ele_of_b_from_a(str_a,str_b);

    puts(str_c);
    return 0;
}
char * delete_ele_of_b_from_a(char *str_a,char *str_b)
{
    int i;
    for (i=0; i<my_str_length(str_b); i++)
    {
        
        str_a = delete_a_char_in_str(str_a,my_str_length(str_a),str_b[i]);
    }
    
    return str_a;
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
