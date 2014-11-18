#include <stdio.h>
#include <string.h>

#define LEN 20

union product
{
	char name[LEN];
	int price;
};

int main()
{
	union product p;
	union product *pp=&p;
	strcpy(p.name,"liling");
	printf("%s\n",p.name);

	strcpy(pp->name,"hello");
	printf("%s\n",pp->name);

	printf("%lu\n",sizeof(union product));
	return  0;
}
