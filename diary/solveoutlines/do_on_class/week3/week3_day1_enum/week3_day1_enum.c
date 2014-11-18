#include <stdio.h>

enum color{red,yellow,green,blue,brown,black,purple};
typedef enum {red,yellow,green,blue,brown,black,purple} COLOR;

const char *p[8] = {"red","yellow","green","blue","brown","black","purple"};

int main(void)
{
	enum color num;
	COLOR c;
#if 0
	for( i = red; i <= purple; i++ )
	{
		printff("%d\n",i);
	}
#endif
	scanf("%d",&num);
	switch(num)
	{
		case red :
			printf("%s",p[0]);
			break;
		case yellow :
			printf("%s",p[1]);
			break;
		case green :
			printf("%s",p[2]);
			break;
		case blue :
			printf("%s",p[3]);
			break;
		case brown :
			printf("%s",p[4]);
			break;
		case black :
			printf("%s",p[5]);
			break;
		case purple :
			printf("%s",p[6]);
			break;
		defalut:
			break;
	}
}
