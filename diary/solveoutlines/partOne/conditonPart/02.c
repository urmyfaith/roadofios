#include<stdio.h>
int main()
{
	int n,i=1,j=2;
	n=0;
	printf("n=%d,i=%d,j=%d\n",n,i,j);
	n=i<j?i++:j++;
	printf("n=i<j?i++:j++\n");
	printf("n=%d,i=%d,j=%d\n",n,i,j);
}

#if 0
i<j?i++;j++
首先,i<j  1<2 ,
n=i++
n=i ,i++
n=1,i=2;
但是这里的j++并不计算，所以j=2
#endif
