#include <stdio.h>

int main(void)
{
	char ch;
	scanf("%c",&ch);
	getchar();//clear cache.

	switch(ch)
	{
		case 'M':
		case 'm':
			printf("Monday\n");
			break;
		case 'T':
		case 't':
			printf("input the second char\n");
			scanf("%c",&ch);
			if(ch=='u')
				printf("Tuesday\n");
			else
				printf("Thurday\n");
			break;
		case 'W':
		case 'w':
			printf("Wendnesday\n");
			break;
			break;
		case 'F':
		case 'f':
			printf("Friday\n");
			break;
		case 'S':
		case 's':
			printf("input the second char\n");
			scanf("%c",&ch);
			if(ch=='a')
				printf("Saturday\n");
			else
				printf("Sunday\n");
			break;
		default:
			printf("error!");	
			break;
	}

	return 0;
}
#if 0
scanf() 读取字符时候，读取缓存区的任何字符（当然包括回车。）
#endif
