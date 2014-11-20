/* 6.字符串交错穿插(15分)
 * 已知两个字符串只由字母和空格组成，但两个字符串中包含的单词数不一定相等
 * 将两个字符串中的单词交错拼接到一起，当其中一个字符串的单词用尽，另一个
 * 字符串中剩余单词自然拼接在后面
 *
 * 传中:"Welcome to qianfeng"  "hello my dear world"
 *
 * 打印:"Welcome hello to my qianfeng dear world"
 * */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define LEN 100

void staggerString(const char *s1,const char *s2);

int main(void)
{
	char str1[LEN] = "God is a girl";
	char str2[LEN] = "My heart will go on";

	staggerString(str1,str2);

	return 0;
}

void staggerString(const char *s1,const char *s2)
{
	int i=0;
	char *sum[100];
	char *word_s1,*word_s2,*content_s1,*content_s2;
	char *sep=" ";
	int len_s1 = strlen(s1),len_s2=strlen(s2);
	char temp_s1[len_s1],temp_s2[len_s2];

	strcpy(temp_s1,s1);
	strcpy(temp_s2,s2);

	//分割字符串，存入数组
	for( word_s1 = strtok_r(temp_s1,sep,&content_s1),word_s2 = strtok_r(temp_s2,sep,&content_s2);
		 word_s1 || word_s2;
		 word_s1 = strtok_r(NULL,sep,&content_s1),word_s2 = strtok_r(NULL,sep,&content_s2) )
	{
		if(word_s1)
			sum[i++] = word_s1;
		if(word_s2)
			sum[i++] = word_s2;
	}
	sum[i]=NULL;

	//输出数组，（最后有一个空格）
	//如果想去掉空格，判断数组长度后输出即可。:w
	for( i = 0 ; sum[i] != NULL; i++ )
	{
		printf("%s",sum[i]);
		putchar(' ');
	}
}

