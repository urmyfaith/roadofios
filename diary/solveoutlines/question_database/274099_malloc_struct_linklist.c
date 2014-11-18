#include <stdio.h>
#include <stdlib.h>

struct s
{
	int n;
	struct s *p;
};

int main(void)
{
	struct s s1,s2,s3;

	scanf("%d",&s1.n);
	scanf("%d",&s2.n);
	scanf("%d",&s3.n);
	
	s1.p = &s2;
	s2.p = &s3;

	printf("%d %d %d",s1.n,(s1.p)->n,(s2.p)->n);
    //优先级. 高于->
    // 运算顺序从左到右。


	return 0;
}
