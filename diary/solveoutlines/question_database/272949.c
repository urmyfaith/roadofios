#include <stdio.h>

int main()
{
	int count=0;
	char ch;
	while((ch=getchar())!='\n')
	{
		if( (ch>='a' && ch<='z' ) ||  (ch>='A'&& ch<='Z'))
			count +=1;
	}
	printf("%d",count);
	return 0;
}
