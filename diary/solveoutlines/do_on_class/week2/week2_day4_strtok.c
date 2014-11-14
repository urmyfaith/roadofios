#include <stdio.h>

#include <string.h>

#define NUM 1024

int  main(void)
{
	char str[NUM] = "we are the world.";
	char *p;
	int i,n = strlen(str);

	p = strtok(str," ");
	printf("%p\n",p);

	for(i=0;i<n;i++)
		printf("%p\tstr[%d]=%c\t%d\n",&str[i],i,str[i],str[i]);

	while(p!=NULL)
	{
		puts(p);
		p= strtok(NULL," ");
	}
	return 0;
}
