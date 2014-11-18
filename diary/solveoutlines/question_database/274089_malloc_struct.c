#include <stdio.h>
#include <stdlib.h>

struct t
{
	int n;
	float m;
};
int main(void)
{	
	struct t *p = NULL;
	p = (struct t *) malloc(sizeof(struct t));
	if( NULL == p )
	{
		printf("malloc memory failed.");
		return 0;
	}
	scanf("%d",&p->n);
	scanf("%f",&p->m);

	printf("%d %.2f",p->n,p->m);

	free(p);
	p = NULL;

	return 0;
}
