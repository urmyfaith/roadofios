#include <stdio.h>
#include <stdlib.h>


struct my_struct
{
	int n;
	char c;
};
int main()
{

	struct my_struct *m = (struct my_struct *)malloc(sizeof(struct my_struct));

	scanf("%d",&m->n);
	while(((m->c)=getchar())==' ')
		;

	printf("%d %c",m->n,m->c);
	free(m);
	m=NULL;
	return 0;	
}
