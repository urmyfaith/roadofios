#include <stdio.h>


int  main()
{
    int a[10]={0,0,0,0,0,0,0,0,0,0};
    int day=10;
    int i=10;
    a[0]=1;
    for(i=0;i<=9;i++)
    {
        a[i+1]=(a[i]+1)*2;
    }
    for(i=9;i>=0;i--)
    {
        printf("%d\n",a[i]);
    }
	return 0;
}

#if 0
倒着考虑，f(n+1)=f(n)-(fn/2+1)
f(n+1)=fn/2-1
==> fn= (f(n+1)+1)*2
f(10)=1
f(9)=?
f(8)=?
...
f(1) =?

#endif
