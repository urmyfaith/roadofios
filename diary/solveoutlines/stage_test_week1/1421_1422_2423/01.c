///*1. 输入一段字符串，已知字符串只由字母和空格构成，每两个单词间有一个或多个空格，统计其中的单词个数 (10分)
//比如：传入 "welcom to     qianfeng"  返回:3
//*/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define LEN 1024
size_t countOfWordInString(const char *str);

int main(void)
{
	char array[LEN]={};
	int i=0;

	while ( (array[i] = getchar() ) != '\n' )
		i++;
	array[i]='\0';

	printf("%ld\n",countOfWordInString(array));

	return 0;
}
size_t countOfWordInString(const char *str)
{
	char *temp = (char *) malloc(sizeof(char));
	strcpy(temp,str);
	unsigned  count =0;
	char *p;
	
	for( p=strtok(temp," ");
		 p;
	     p=strtok(NULL," ") )
	{
		count++;
	}
	free(temp);
	return count;
}
