#include <stdio.h>

int main()
{
	//int a[5]={1,2,3,4};
	//int a[5];
	//int a[5]={1,23};
	int a[5]={};
	for(int i=0;i<5;i++)
	{
		printf("&a[%d]=%p\n",i,&a[i]);
	}
	printf("&a=%p\n",a);

	printf("%d\n",a[6]);

	printf("\'\\0\' ASCII=%d\n",'\0');

	//------2014-11-06_17_44_35
	char b[10] = {};
	for(int j=0;j<10;j++)
	{
		if( (b[j]=getchar()) == '\n')
		{	
			b[j]='\0';
			break;
		}
	}
	
	
	char str[100]="abcdef";
	for(int k=0;str[k]!='\0';k++)
	{
		printf("%c",str[k]);
	}

	char s[10]={};
	//scanf("%s",s);
	gets(s);
	puts(s);

	
	return 0;
}
