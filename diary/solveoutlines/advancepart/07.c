#include <stdio.h>

void break_up_num(int n);

int main()
{
	int num;
	
	scanf("%d",&num); 
	break_up_num(num);

	return 0;
}

void break_up_num(int n)
{
	int i,j = 0;
	int array[1024]={};
	int temp = n;

	while( 1 != n ) //循环结束的条件，最后的时候， 因数位自身。
	{
		for ( i = 2; i <= n; i++)
		{
			if( 0 == n%i )
			{
				array[j] = i;
				n = n / i ;
				j++;
				break;
				// 如果可以被整除，那么，把这质因数加入数组，
				// 然后计算 被整除后的数的质数。 break跳出for循环。
				// 60 % 2 =0---> array[0] =2, 
				// 30 % 2 =0---> array[1]=2
				// 15 % 3 =0---> array[2]=3
				// 5 % 5 =0 --->array[3]=5; 
				//  5/5 = 1 ---> 循环结束，跳出while。
			}
		}
	}
	printf("%d=1",temp);
	for( i = 0; 0 != array[i]; i++ )
	{
		printf("*%d",array[i]);
	}
	printf("\n");

}
