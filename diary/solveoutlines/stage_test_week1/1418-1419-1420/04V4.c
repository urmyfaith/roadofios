#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define NUM 1024

void reverse_word(char *str,char *sep);

int  main()
{
	char str[NUM]="God is a girl";
	char *sep=" ";
	int i =0;

	puts(str);
	reverse_word(str,sep);

	puts(str);

	return 0;
}

/*
 * p 存放分隔后返回的指针
 * s 存放分隔后的数组
 * q 逆序保存数组
 * */
void reverse_word(char *str,char *sep)
{
	int i = 0,length = strlen(str);
	char *p = NULL;
	char *s[100]={};
	char *q = (char *) malloc(sizeof(char)*length);

	//分割
	for( p = strtok(str,sep);
		 p;
		 p = strtok(NULL,sep) )
	{
		s[i++] = p;
 	}
	//逆序保存
	for (i--; i>0; i--)
	{
		strcat(q,s[i]);
		strcat(q,sep);
	}
	strcat(q,s[0]);
	strcat(q,"\0");
	//结果保存
	strcpy(str,q);
	free(q);
}
