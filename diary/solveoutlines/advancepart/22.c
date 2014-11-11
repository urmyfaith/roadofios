// 给定一个英文句子，单词之间用一个或者多个空格分开，求其中所有单词的数量。

#include <stdio.h>


#define NUM 1024

int count_words_in_oneline( char *str);

int  main()
{
	char  oneline[NUM]={};
	int i;
	int count;
	printf("给定一个英文句子，单词之间用一个或者多个空格分开，求其中所有单词的数量。\n");
	printf("input a sentence:\n");
	while((oneline[i++]=getchar()) != '\n')
		continue;
	oneline[i] = '\0';
	
	count  = count_words_in_oneline(oneline);
	printf("%d words in sentence above.\n",count);


	return 0;
}

int count_words_in_oneline( char *str)
{
	int i;
	int counts = 0;
	while('\0' != *str )
	{
		if(' ' == *str)
		{
			while(' ' == *str )
			{
				str++;
			}
			counts += 1;
		}
		str++;
	}
	counts += 1;
	return counts;
}

	
