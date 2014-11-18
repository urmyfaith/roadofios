#include <stdio.h>
#include <stdlib.h>

#define _ERROR 0
#define _OK 1
#define  MAXQSIZE 10

typedef int QElementType;
typedef int status;

typedef int bool;
#define TRUE 1
#define FALSE 0

typedef struct
{
    QElementType *base;
    int front;
    int rear;
} SqQueue;

status InitQueue(SqQueue *Q)
{
    Q->base = (QElementType *) malloc(MAXQSIZE*sizeof(QElementType));
    if (Q->base == NULL)
        return _ERROR;
    Q->front  = Q->rear = 0;
    return _OK;
}

bool Is_Empty(SqQueue *Q)
{
    
    return Q->front==Q->rear;
}

bool IsFull(SqQueue *Q)
{
    //
    return ((Q->rear)+1)%MAXQSIZE == (Q->front);
}

int QueueLength(SqQueue *Q)
{
    return (Q->rear-Q->front+MAXQSIZE)%MAXQSIZE;
}

status InQueue(SqQueue *Q,QElementType e)
{
    if(IsFull(Q))
    {
        printf("The Queue is FULL!\n");
        return _ERROR;
    }
    (Q->base)[Q->rear]= e;
    Q->rear =(Q->rear+1)%MAXQSIZE;
    return _OK;
}
status OutQueue(SqQueue *Q,QElementType *e)
{
    if(Is_Empty(Q))
    {
        printf("The Queue is tempty!\n");
        return _ERROR;
    }
    
    *e = (Q->base)[Q->front];
    Q->front = (Q->front +1)%MAXQSIZE;
    return _OK;
}

void PrintQueue(SqQueue *Q)
{
    for ( int i = Q->front; i%MAXQSIZE < Q->rear; i++ )
    {
        printf("Q->base[%d]=%d\n",i,Q->base[i]);
    }
}

void DestroyQueue(SqQueue *Q)
{
	free(Q->base);
	Q=NULL;
}

int main(void)
{
    SqQueue *Q;
    status s = InitQueue(Q);
    
    printf("Init Status:\t %d\n",s);
    
    int i ;
    int *temp=(int *)malloc(sizeof(int));
    for( i = 0; i < MAXQSIZE; i++ )
    {
        InQueue(Q,i+1);
    }
    PrintQueue(Q);
    for( i = 0; i < MAXQSIZE; i++)
    {
       if( OutQueue(Q,temp))
		   printf("Q->base[%d]=%d\n",Q->front,*temp);
    }
    DestroyQueue(Q);
    
    return 0;
}
