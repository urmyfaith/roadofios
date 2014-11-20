#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define NUM 20

struct node
{
    int num;
    int no;
    char word[NUM];
    struct node *next;
};
void node_init(struct node *);
void node_insert(struct node *,int ,char *);
void node_print(struct node *);
void get_oneline(char *s);
struct node *node_search_no(struct node *p,int no);
struct node * node_search_word(struct node *p,char *w);
char * split_word(struct node *p);
int main()
{
    //	struct node *head;
    struct node head;
    int i,num;
    char buf[NUM]={};
    struct node *word;
    
    node_init(&head);
    for(i=0;i<5;i++)
    {
        scanf("%d",&num);
        while( getchar() != '\n')
            ;
        get_oneline(buf);
        node_insert(&head,num,buf);
    }
    node_print(&head);
    
    printf("\ninput search no:\n");
    scanf("%d",&num);
    word = node_search_no(&head,num);
    puts(word->word);
    
    
    printf("\ninput search word:\n");
    while( getchar() != '\n')
        ;
    get_oneline(buf);
    word =  node_search_word(&head,buf);
    printf("%s\n",split_word(word));
    free(word);
    
    return 0 ;
}
char * split_word(struct node *p)
{
    //char *word;
    char *word=(char *)malloc(sizeof(char));
    strcpy(word,p->word);
    word=strtok(word,":");
    word=strtok(NULL,":");
    return word;
}
void get_oneline(char *s)
{
    int i;
    while( (s[i]=getchar())!='\n')
        i++;
    s[i]='\0';
}

void node_init(struct node *p)
{
#if 0
    p =(struct node *) malloc(sizeof(struct node));
    if( NULL != p )
    {
        p->next = NULL;
    }
#endif
    p->no=0;
    strcpy(p->word,"dictionay:词典");
    p->next = NULL;
}
void node_insert(struct node *p,int no,char *s)
{
    struct node *new_node = ( struct node *) malloc(sizeof(struct node));
    
    if( new_node != NULL)
    {
        new_node->no = no;
        strcpy(new_node->word,s);
        new_node->next = p ->next;
        p->next = new_node;
    }
}

void node_print(struct node *p)
{
    while(p!=NULL)
    {
        printf("p->no=%d\tp->word=%s\n",p->no,p->word);
        p=p->next;
    }
}

struct node *node_search_no(struct node *p,int no)
{
    struct node *reback ;
    while(1)
    {
        if(p->no == no)
        {
            reback=p;
            break;
        }
        p=p->next;
    }
    return reback;
}
struct node * node_search_word(struct node *p,char *w)
{
    struct node *reback;
    char *word=(char *)malloc(sizeof(char));
    while(p)
    {
        strcpy(word,p->word);
        word =strtok(word,":");
        if(strcmp(word,w) == 0)
        {
            reback=p;
            free(word);
            break;
        }
        p=p->next;
    }
    return reback;
}
