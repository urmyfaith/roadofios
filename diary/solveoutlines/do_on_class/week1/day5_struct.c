#include <stdio.h>
#include <stdlib.h>
#include <string.h>


#define LENGTH 20

struct book
{
	char name[LENGTH];
	char author[LENGTH];
	float price;
};


int main(void)
{
	struct book bk = {
		"c prime pluse",
		"zx",
		45.0,
	};
	//bk的类型是struct book；
	//数组是元素，引用使用【】
	//结构体成员引用，可以使用.
	
	printf("%s\n",bk.name);
	printf("%s\n",bk.author);
	printf("%.2f\n",bk.price);

	//结构体指针；
	
	struct book *p;
	p = malloc(sizeof(struct book));
	strcpy(p->name,"hello");
	strcpy(p->author,"zx2");
	p->price = 100.0;

	printf("%s\n",p->name);
	printf("%s\n",p->author);
	printf("%.2f\n",p->price);

	return 0;
}
