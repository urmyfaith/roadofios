#include <stdio.h>

int main(void)
{
	char ch;
	scanf("%c",&ch);
	getchar();//clear cache.

	switch(ch)
	{
		case 'M':
			printf("Monday\n");
			break;
		case 'T':
			printf("input the second char\n");
			scanf("%c",&ch);
			if(ch=='u')
				printf("Tuesday\n");
			else
				printf("Thurday\n");
			break;
		case 'W':
			printf("Wendnesday\n");
			break;
			break;
		case 'F':
			printf("Friday\n");
			break;
		case 'S':
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
