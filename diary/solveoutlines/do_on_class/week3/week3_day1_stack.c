#include<stdio.h>

#define NUM 5

struct my_stack
{
	int index;
	int arr[NUM];
};

void my_stack_init(struct my_stack *p);
void my_stack_push(struct my_stack *p,int num);
int my_stack_pop(struct my_stack *p);

int main(void)
{
	struct my_stack sta;
	int i;
	my_stack_init(&sta);
	for( i = 0; i < NUM; i++ )
	{
		my_stack_push(&sta,i);
	}
	for( i = 0; i < NUM; i++ )
	{
		printf("%3d",my_stack_pop(&sta));
	}

//	printf("\n%d\n",sta.index);

	return 0;
}
void my_stack_init(struct my_stack *p)
{
	p->index = -1;
}

void my_stack_push(struct my_stack *p,int num)
{
	if( p->index == NUM-1 )
		return ;
	else
	{
		p->arr[p->index+1] = num ;
		p->index++;//--> high;
	}

}

int my_stack_pop(struct my_stack *p)
{
	int reback;

	if(p->index == -1)
	{
		printf("blank stack.");
		return  -1;
	}
	else
	{
		reback = p->arr[p->index];
		p->index--;
	}
	return reback;
}
