/*
	栈(stack)：先入后出
		该结构就相当于一个水桶，底部是封死。
		然后一个数据相当于一张恰好能够放进桶
		里面的圆盘，一个圆盘就是一个有效的数
		据。
		在把圆盘放进桶里，先放入桶里的是在下
		面，后放入的在上面，所以若是想取出先
		放入的圆盘，就得先取出它后面放进去的
		所有圆盘。


*/
#include<stdio.h>

#define NUM 10
struct my_stack
{
	int arr[NUM];
	int n;
};
void stack_init(struct my_stack *p);
void stack_push(struct my_stack *p, int value);
int stack_pop(struct my_stack *p);

int main(void)
{
	struct my_stack stack;
	int i,num;
	stack_init(&stack);
	for(i=0; i<5; i++) {
		scanf("%d",&num);
		stack_push(&stack,num);
		printf("stack.n=%d	stack.arr[%d]=%d\n",stack.n,stack.n,stack.arr[i]);
	}

	for(i=0; i<5; i++) {
		printf("%d\n",stack_pop(&stack));	
	}

	return 0;	
}

/*栈在使用之前初始化一下*/
void stack_init(struct my_stack *p)
{
	/*
	  在该栈实现的时候，是先通过数组下标变量先加1
	  找到存储新数据的新位置，而数组实现的这个栈相
	  邻两个元素值相差为1，所以这里初始化的时候是把
	  p->n的值先设置为-1
	*/
	p->n=-1;	
}

/*往栈中压入一个数据*/
void stack_push(struct my_stack *p, int value)
{
	/*
	  考虑栈是否已经满了，若满了需要通知一下，另外当
	  然也不能执行存储操作了
	*/
	if(p->n==NUM-1) {
		printf("the stack is full.\n");
		return ;
	}
	else {
	/*栈不满的情况下把一个数据压入栈的具体操作*/
		p->n=p->n+1;
		//p->n++;
		p->arr[p->n]=value;
	}
}

/*从栈中弹出一个数据*/
int stack_pop(struct my_stack *p)
{
	int a;
	/*
	  栈弹出数据的时候需要考虑栈是否已经空了，
	  如果栈空了的情况下，那就不必弹出数据了，
	  另外顺带提示一下
	*/
	if(p->n==-1) {
		printf("the stack is empty.\n");
		return -1;
	}
	else {
		/*
		  栈非空情况下弹出一个数据的具体操作，
		  这里需要考虑的一个问题是，把一个数据
		  压入栈的时候栈的位置已经是新压入数据
		  的内存存储位置，故取出的时候是先取用，
		  而这个时候是利用返回值取道的这个新弹
		  出的数据。而非空栈弹出一个数据之后仍
		  要保证栈的位置是下一个即将弹出数据的
		  内存位置，所以在返回这个弹出的数据之
		  前还需要做的一个操作是位置的的更新，
		  这就是变量a存在的价值
		*/
		a=p->arr[p->n];
		p->n--;
		return a;
	}
}






