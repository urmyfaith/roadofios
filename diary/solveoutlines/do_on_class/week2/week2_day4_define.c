#include <stdio.h>

int main()
{

	#define MAX(a,b) a+b
	
	printf("%d\n",MAX(3,4));
	printf("%d\n",MAX(3+2,3+4));


	#define MUL(a,b) a*b
	printf("%d\n",MUL(3,4));
	printf("%d\n",MUL(3+2,3+4));
	#undef  MUL
	
	#undef  MAX
}
