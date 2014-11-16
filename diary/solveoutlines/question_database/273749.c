#include <stdio.h>

struct my_struct
{
	int n;
	char c;
};
int main()
{

	struct my_struct m ;

	scanf("%d",&m.n);
	while((m.c=getchar())==' ')
		;

	printf("%d %c",m.n,m.c);
	return 0;	
}
