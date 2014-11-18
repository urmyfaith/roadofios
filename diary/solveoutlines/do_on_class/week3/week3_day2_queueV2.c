#include <stdio.h>

#define NUM 5

struct queue
{
	int arr[NUM];
	int head;
	int tail;
};
void queue_init( struct queue *p );
void queue_push( struct queue *p,int n);
int  queue_pop( struct queue *p);

int main(void)
{
	struct queue q;
	queue_init(&q);
	int i,num;
	for ( i = 0; i < NUM; i++ )
	{
		scanf("%d",&num);
		queue_push(&q,num);	
	}
	for ( i = 0; i < NUM; i++ )
	{
		printf("q->arr[%d]=%d\n",q.head,queue_pop(&q) );
	}
	return 0;
}

void queue_init( struct queue *p )
{
	p->head = 3;
	p->tail = 3;
}

void queue_push( struct queue *p,int n)
{
	if((p->tail+1)%NUM == p->head)	
	{
		printf("queue is full\n");	
	}
	else
	{
		p->arr[p->tail] = n;
		p->tail = (p->tail+1)%NUM;
	}
}

int  queue_pop( struct queue *p)
{
	int reback = -1;

	if(p->tail == p->head)
	{
		printf("queue is empty!\n");
	}
	else
	{
		reback = p->arr[p->head];
		p->head = (p->head+1)%NUM;
	}
	return reback;
}
	
