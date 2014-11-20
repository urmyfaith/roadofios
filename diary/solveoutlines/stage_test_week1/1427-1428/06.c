#include <stdio.h>
#include <string.h>
#define NUM 1024

void mostWordInString(const char *str);

int stringOfSubstring(const char *s1,const char *s2);

int main(void)
{
	char s1[NUM]={};
	int i=0;
	while( (s1[i]=getchar())!='\n')
		i++;
	s1[i] = '\0';
// printf("%d",stringOfSubstring(s1,"drink"));
	mostWordInString(s1);

	return 0;
}

void mostWordInString(const char *str)
{
	unsigned long len = strlen(str);
	char s[len+1];
	char *array[len+1];
	int i=0,cnt,max =0,flag =0;

	strcpy(s,str);
	array[i]=strtok(s," ");
	while( (array[++i]=strtok(NULL," ")) !=NULL)
		;
	for(i=0;array[i]!=NULL;i++)
	{
		// puts(array[i]);
		cnt = stringOfSubstring(str,array[i]);
		if(cnt >max)
		{
		
			max = cnt;
			flag =i;
		}
	}
	printf("%s%d",array[flag],max);
}

int stringOfSubstring(const char *s1,const char *s2)
{
	int count=0;	
	
	while( (s1=strstr(s1,s2))!= NULL)
	{
		count++;
		s1++;
	}
	return count;
}
