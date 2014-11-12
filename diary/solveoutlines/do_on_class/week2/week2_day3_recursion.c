#include <stdio.h>


void my_recursion( int n);

int main(void)
{
	my_recursion(3);
	return 0;
}

void my_recursion( int n)
{
	printf("open %d\n",n);
	if(n==0)
	{
		printf("\n\n");
		return ;
	}
	else
		my_recursion(n-1);
	printf("close %d\n",n);

}
