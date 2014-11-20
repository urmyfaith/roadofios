#include <stdio.h>
#include <stdlib.h>

struct node
{
	int num;
	struct node *next;
};
void node_init(struct node *p);
void node_insert(struct node *p,int num);
void node_print(struct node *p);
void node_destory(struct node *p);

int main()
{
//	struct node *head;
	struct node head;
	int i,num;
	node_init(&head);
	for(i=0;i<5;i++)
	{
		scanf("%d",&num);
		node_insert(&head,num);
	}
	node_print(&head);
	node_destory(&head);
	node_print(&head);

	return 0 ;
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
	p->num=0;
	p->next = NULL;
}
void node_insert(struct node *p,int num)
{
	 struct node *new_node = ( struct node *) malloc(sizeof(struct node));

	 if( new_node != NULL)
	 {
		new_node->num = num;
		new_node->next = p ->next;
		p->next = new_node;
	 }
}

void node_print(struct node *p)
{
	while(p!=NULL)
	{
		printf("p->num=%d\tp->next=%p\n",p->num,p->next);
		p=p->next;
	}
}

void node_destory(struct node *p)
{
	struct node *cur;
	while(p->next)
	{
		cur = p->next;
		p->next = p->next->next;
		free(cur);
	}
}
