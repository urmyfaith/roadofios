/*字符串排序。比较三个字符串的大小，
 * 然后按从小到大的顺序将字符串输出。
 * 比如：
 * 输入
 * asdfwd
 * ddrwf
 * ffweff
 * 输出为
 * asdfwd
 * ddrwf
 * ffweff
 *
 * 输入 
 * sgfgeasdfw
 * aabbe
 * wrwwdfaf
 * 输出为
 * aabbe
 * sgfgeasdfw
 * wrwwdfaf
 * */
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#define NUM 100

void char_array_sort(char *p[],int size);

int main(void)
{
	char s1[NUM];
	char s2[NUM];
	char s3[NUM];
	char *p[20];
	int i=0;

	while( (s1[i]=getchar()) != '\n' )
		i++;
	s1[i]='\0';


	i=0;
	while( (s2[i]=getchar()) != '\n' )
		i++;
	s2[i]='\0';

`x`
	i=0;
	while( (s3[i]=getchar()) != '\n' )
		i++;
	s3[i]='\0';
	

	i=0;
	p[0]=s1;
	p[1]=s2;
	p[2]=s3;
	p[3]=NULL;
	char_array_sort(p,4);
	putchar('\n');
	puts(p[0]);
	puts(p[1]);
	puts(p[2]);

	return 0;
}
void char_array_sort(char *p[],int size)
{
	int i,j,flag;
	char *temp = (char *) malloc(sizeof(char));
	int num;

	num = size -1;
	for( i = num-1; i >=0; i--)
	{
		flag = i;
		for( j = 0; j < i; j++ )
		{
			if(strcmp(p[flag],p[j])<0)
				flag =j;
		}
		if(flag !=i)
		{
#if 1
			temp = p[i];
			p[i] = p[flag];
			p[flag]=temp;
#endif
			//下面的交换方法也行
#if 0
			strcpy(temp,p[i]);
			strcpy(p[i],p[flag]);
			strcpy(p[flag],temp);
#endif
		}
	}
	free(temp);
}