#include <stdio.h>

#define NUM 10
int main(void)
{
    int num;

	printf("\nintput array size,num:\n");
    scanf("%d",&num);
	//清空缓存区域。
	while(getchar() != '\n')
		continue;


	printf("\nintput each char:\n");
    char str[num];
    int i;
    for ( i = 0 ; i < num ; i++)
    {
        scanf("%c",&str[i]);
        //scanf("%c",str + i);
    }
	str[i-1]='\0';

	puts(str);
    return 0;
}
