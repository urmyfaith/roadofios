#include <stdio.h>
#include <string.h>

void printstring(const char *str)
{
    int i,j;
    int len=strlen(str);
    for(i=0; i<len; i++) {
        for(j=0; j<len; j++) {
            if(i==0)
                putchar(str[j]);
            else if(i<len-1) {
                if(j==0)
                    putchar(str[i]);
                else if(j==len-1)
                    putchar(str[len-1-i]);
                else
                    putchar(' ');	
            }else		
                putchar(str[len-1-j]);
        }	
        putchar('\n');
    }	
}

int main(void)
{
#if 1
	char str[1024]={};
	int i=0;
	while((str[i]=getchar())!='\n')
	{
		i++;
	}
	str[i]='\0';
	printstring(str);

#endif
}
