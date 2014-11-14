#include <stdio.h>

#define NUM 1024

int main(void)
{
	FILE *fp;
	int num;
	char buf[NUM]={};
	//fp=fopen("temp.txt","r+");
	fp=fopen("temp.txt","r");
	if(fp!=NULL)
	{
//		num = 	fputs("abc",fp);
//		printf("%d\n",num);
		fgets(buf,NUM,fp);
		puts(buf);
	}

	if(	fclose(fp))
	{
		printf("file close FAILED!.\n");
	}


	return 0;
}
