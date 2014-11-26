#include <stdio.h>
#include <string.h>
#include <stdlib.h>


int numbersOfSubtitleInString(const char *str)
{

	//上面代码不要动
	//   //your code...
	int count = 0;
	int i;
	char *p = (char *) malloc(sizeof(char));
	strcpy(p,str);
	while(p[i] != '\0')
	{
		if( ( p[i]>='a' && p[i] <='z' ) ||
			( p[i]>='A' && p[i] <='Z' )  )
			count++;
		i++;
	}
	return count;
	
	//下面代码不要动
}

int main(void)
{
	char a[100]="abc123def456";
	printf("%d",numbersOfSubtitleInString(a));
	return 0;
}
