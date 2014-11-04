#include<stdio.h>

int main()
{
	int a=3,b=4;
	printf("a=%d,b=%d\n",a,b);
	printf("%d\n",a^b);
	a=a^b;
	printf("%d\n",b^a);
	b=b^a;
	printf("%d\n",a^b);
	a=a^b;
	printf("a=%d,b=%d\n",a,b);
	return 0;
}

#if 0
a = 3    0011  
b = 4	 0100
a^b		 0111 
		
			 0111
			 0100
			 0011 --->
							0111
							0011
							0100 ---->
#endif
				
