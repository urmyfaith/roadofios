#include <stdio.h>

#define NUM 1024

int main()
{
    int i,j;
    int sum ;
    
    int array[NUM]={};
    
    for ( i = 1; i < 1000; i++ ) //外层 从1 到1000
    {
        int k=0;
        for( j = 1; j <= i; j++)	//对某个数取余数
        {
            if( 0 == i%j )
            {
                array[k] =j;		//放入数组；
                if( i == j )
                {
                    array[k] = 0;	//自身不放入数组
                    sum = 0;
                    for ( int l = 0 ; 0 != array[l] ; l++)
                    {
                        sum += array[l];
					}
					if( sum == i)
					{
						for( int n = 0 ; 0 != array[n] ; n++)
						{
							printf("%d+",array[n]);
						}
						printf("=%d\n",sum);
					}
                    for( int n = 1 ; n < NUM; n++)
                    {
                        array[n] =0;
                    }
                }
                k++;
            }
        }
    }
    return 0;
}
