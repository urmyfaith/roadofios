#include <stdio.h>
#include <stdlib.h>
#include <string.h>


int main()
{
    int i,one_line_size = 100;
    FILE *fp = NULL;
    char one_line_buf[200]={};
    char *sep=",";
    char *one_word=NULL;
    
    if( (fp=fopen("demo.csv","r"))==NULL)
    {
        printf("can not open file");
        return 0;
    }
    
    while( fgets(one_line_buf,one_line_size,fp) != NULL )
    {
        one_word = strtok(one_line_buf,sep);
        
        for(i = 0; i < 3; i++ )
        {
            switch (i)
            {
                case 0:
                    printf("%2d,",(int)(atoi(one_word)));
                    break;
                case 1:
                    printf("%s,",one_word);
                    break;
                case 2:
                    printf("%.4f",(double)(atof(one_word)));
                    break;
                default:
                    break;
            }
            one_word = strtok(NULL,sep);
        }
		printf("\n");
    }
    return 0;
}
