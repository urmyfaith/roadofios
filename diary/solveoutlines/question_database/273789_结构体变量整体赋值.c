#include <stdio.h>
#include <stdlib.h>


struct s
{
	int num;
	char c;
};
int main()
{

	struct s m,n;

	scanf("%d",&m.num);
	while((m.c=getchar())==' ' || (m.c=='\n') )
		;
	n = m;
	printf("%d %c",n.num,n.c);
	return 0;	
}
