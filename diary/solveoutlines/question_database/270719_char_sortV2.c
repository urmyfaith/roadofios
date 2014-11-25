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
 * */
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#define MAX_STRING_LEN 20

void char_array_sort(char *p[],int size);

int main(void)
{
	char *p[MAX_STRING_LEN];
	int i,j,string_count;
	char ch;
	printf("input sting number:\n");
	scanf("%d",&string_count);

	//输入字符串保存到数组里
	for( i = 0; i < string_count; i++ )
	{
		p[i] = (char *)malloc(sizeof(char));

		//多次换行的情况
		j=0;
		while( (ch=getchar())=='\n' );
		p[i][j++]=ch;

		while( ( p[i][j]=getchar()) !='\n')
			j++;
		p[i][j]='\0';
	}
	p[i]=NULL;
	
	//选择排序
	char_array_sort(p,string_count+1);
	

	//排序后输出
	putchar('\n');
	for(i = 0; p[i] !=NULL ; i++ )
		puts(p[i]);

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
