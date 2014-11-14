// 判断字符串包含关系
// "abcdefghj78"   "defg"

#include <stdio.h>
int my_str_length(const char *p);
int is_stringB_in_stringA(char *str_a,char *str_b);
int search_char_in_string( const char *p,char ch);

int main()
{
    char str_a[20]="abcdefghj28";
    char str_b[10]="defgh";
    printf("%d" ,is_stringB_in_stringA(str_a,str_b));
    return 0;
}

//从a中查找b中的字符，如果找到一个相等的，
//  同时移动指针比较，值到a结束或者b结束
//如果再次找到一个字符，同上。

int is_stringB_in_stringA(char *str_a,char *str_b)
{
    int i,j,flag,is_find=1;
    char * temp_str_a;
    
    for (j=0; str_a[j]; j++)
    {
        temp_str_a = str_a+j;
        flag =  search_char_in_string(temp_str_a,str_b[0]);
        if (-1 != flag)//str_a[falg] == str_b[0]成立
        {
            for (i=1; str_b[i] != '\0'; i++)
            {
                if (str_b[i]!=str_a[flag+i])
                {
                    is_find = -1;
                    break;
                }
            }
            if (i== my_str_length(str_b))
            {
                is_find=1;
                break;
            }
        }
    }
    return is_find;
}


//返回一个字符在一个字符数组中的下标
//找到返回下标，找不到返回-1
int search_char_in_string( const char *p,char ch)
{
    int i;
    for (i=0; '\0' != *p; i++) {
        if (p[i] == ch) {
            return i;
        }
    }
    return -1;
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
