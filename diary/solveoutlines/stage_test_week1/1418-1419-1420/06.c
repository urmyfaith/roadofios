#include <stdio.h>

#define NUM 1024

int is_start_with_number(const char *str);
int is_contain_star_or_sharp(const char *str);
int isCValidVar(const char *str);

int  main()
{
#if 1
	char str[NUM]={};
	int i=0;
	printf("input a variable:\n");

	while( (str[i]=getchar()) != '\n' )
	{
		i++;
	}
	str[i]='\0';
	printf("\nvariable %s is %s.\n",str,( (isCValidVar(str)==1) ? "valid" : "invalid"));
#endif

	return 0;
}

int isCValidVar(const char *str)
{
	int flag=1;
	//不能数字开头
	//不能含有*，#
	if(is_start_with_number(str) || is_contain_star_or_sharp(str))
	{
		flag =0;
	}
	return flag;
}

int is_start_with_number(const char *str)
{
	if(*str>='0' && *str <= '9')
		return 1;
	return 0;
}
int is_contain_star_or_sharp(const char *str)
{
	int flag =0;
	char *p = (char *)str;
	while(*p != '\0')
	{
		if(*p=='*' || *p =='#')
		{
			flag = 1;
			break;
		}
		p++;
	}
	return flag;
}
