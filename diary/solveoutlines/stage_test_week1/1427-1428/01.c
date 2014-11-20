////1.实现函数，传入一个时间的字符串，打印出下一秒的字符串(15)
////传入:"23:59:59"
////打印:"00:00:00"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define LEN 1000

void printNextSecond(const char *timeStr);

int main(void)
{
	char arr[LEN];
	int i;
	while( (arr[i]=getchar() )!='\n')
		i++;
	arr[i]='\0';

	printNextSecond(arr);
	return 0;
}
void printNextSecond(const char *timeStr)
{
	int h,m,s;
	char *time = (char *) malloc(sizeof(char));
	strcpy(time,timeStr);

	h = atoi( strtok(time,":"));
	m = atoi( strtok(NULL,":"));
	s = atoi( strtok(NULL,":"));
	if(s==59)
	{
		s=0;
		if( m == 59 )
		{
			m=0;
			if(h == 23)
				h=0;
			else
				h++;
		}
		else
			m++;
	}
	else
		s++;
	free(time);
	printf("%02d:%02d:%02d",h,m,s);
}

