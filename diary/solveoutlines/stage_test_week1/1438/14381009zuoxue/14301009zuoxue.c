#if 1

//001
//1.输出1到100,以%3d的形式打印，相邻的数用一个空格隔开，并控制格式每行输出10个数。

#include <stdio.h>

int main(void)
{
	int i ;

	for ( i = 1; i <= 100; i++ )
	{
		printf("%3d ",i);
		if(i%10==0)
			printf("\n");
	}
	return 0;

}
#endif

#if 0
//002
/*2.从终端输入F打印图形下述图形:
	ABCDEFEDCBA
	ABCDEFEDCBA
	ABCDEFEDCBA
	ABCDEFEDCBA
	ABCDEFEDCBA
 若输入C打印下述图形:
	ABCBA
	ABCBA
	ABCBA
 */
#include <stdio.h>

int main()
{
	char ch;
	int i,row,col;
	char a = 'A';
	
	scanf("%c",&ch);

	row = ch - 'A' + 1; // F-->6 ,A-->1;

	for ( i = 0; i < row ; i ++ ) //输出多少行；
	{
		for ( col = 0; col < row*2 - 1 ; col++ ) //输出列；
		{
			if ( col < row )
				printf("%c", ch + col - row + 1);
			else
				printf("%c", ch - col + row - 1);
		
		}
		printf("\n");
		
	}


	return 0;
}

#endif


#if 0
//003

/*
 
 3.打印下述图形:
	ABCDEF
	BCDEF
	CDEF
	DEF
	EF
	F

 */
# include <stdio.h>

int main()
{
	int i,j;
	
	for ( i = 0 ; i < 6; i++ ) //输出行数为6
	{
		for ( j = 0; j< 6 - i; j++ ) // 输出列数，列数位 6 ，5 ，4 .。1
		{
			printf("%c",'F' - (6-i) + j + 1 );
		}
			
		printf("\n");	
	}

	return 0;
}
#endif

#if 0

//004
/*
 4.从终端输入两个数整数m和n，求m的n次方(在计算机能表示的范围内)
 */
#include <stdio.h>

int main()
{
	int m,n,i;
	double result = 1.0;

	scanf("%d%d",&m,&n);
	
	for ( i = 1; i <= n ; i++ )
	{
		result = result * m;
	}
	printf("%.f\n",result);

	return 0;
}

#endif


#if 0
//005
/*
 
 5.声明一个有十个元素的整型数组，这十个元素是从终端输入的，输入完成后把第一个元素
 和第10个元素对调，第二个元素与第9个元素对调，第三个元素与第八个元素对调，第四
 个元素与第七个元素对调，第五个元素与第六个元素对调。
 */
#include <stdio.h>

#define NUM 10

int main(void)
{
	int array[NUM]={};
	int i;
	int temp;

	for ( i = 0; i < NUM; i++ )
	{
		scanf("%d", &array[i]);
	}
	
	for ( i = 0; i< NUM/2; i++ )
	{
		temp =  array[i];
		array[i] = array[NUM-i-1];
		array[NUM-i-1] = temp;
	}

	for ( i = 0; i < NUM; i++ )
	{
		printf("%d ",array[i]);
	}
	printf("\n");
	

	return 0;
}
#endif


#if 0

//006
/*
 
 6.完数又称完全数或完美数，即该数的所有因子（除去其本身）之和等于其本身。打印出1到
 1000以内的所有完数。

 */:#include <stdio.h>

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

#endif

#if 0

//007

/*
 
 7.从终端输入5个数，求这五个数的最大公约数和最小公倍数。
 */
#include <stdio.h>

#define NUM 5

int main()
{
	int array[NUM]={};
	int i;

	for ( i = 0; i < NUM; i++ )
	{
		scanf("%d",&array[i]);
	}

	for ( i = 0; i < NUM; i++ )
	{
		printf("%d",array[i]);
	}
	//最大公约数；
	//
	//
}
#endif
