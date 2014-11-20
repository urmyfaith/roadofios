#include <stdio.h>
#include <string.h>
#include <stdlib.h>

void combine_string(char *p,char *q);

int main()
{
    char *s1="God is a girl";
    char *s2="season in the son son";
    
    combine_string(s1,s2);
    
    return 0;
}

void combine_string(char *p,char *q)
{
    
    char *s[100];
    int k=0,count =0;
    char array_p[100],array_q[100];
    strcpy(array_p,p);
    strcpy(array_q, q);
    char *sep=" ";
    char *word_p,*word_q,*content_p,*content_q;
    
    //分隔单词，进入数组
    for( word_p = strtok_r(array_p,sep,&content_p),word_q = strtok_r(array_q,sep,&content_q);
        (word_p || word_q);
        word_p = strtok_r(NULL,sep,&content_p) ,word_q = strtok_r(NULL,sep,&content_q) )
    {
        if(word_p)
            s[k++] = word_p;
        if(word_q)
            s[k++] = word_q;
    }
    
    //计算数组长度
    for (k=0; s[k];k++)
    {
        count++;
    }
    //输出
    for (k = 0; k < count-1; k++)
    {
        printf("%s",s[k]);
        printf(" ");
    }
    printf("%s",s[k]);
}// main结束













#if 0
for(word_p=strtok_r(p, sep, &content_p);
    word_p;
    word_p=strtok_r(NULL, sep,&content_p) )
{
    for (word_q=strtok_r(q, sep, &content_q);
         word_q;
         word_q=strtok_r(NULL, sep, &content_q))
    {
        printf("--%s---%s---\n",word_p,word_q);
    }
    
}

#endif

#if 0
char *test =p;
char *blah =q;
char *sep = "\\/:;=-";
char *word, *phrase, *brkt, *brkb;
for (word = strtok_r(test, sep, &brkt);
     word;
     word = strtok_r(NULL, sep, &brkt))
{
    for (phrase = strtok_r(blah, sep, &brkb);
         phrase;
         phrase = strtok_r(NULL, sep, &brkb))
    {
        printf("So far we're at %s:%s\n", word, phrase);
    }
}

#endif

