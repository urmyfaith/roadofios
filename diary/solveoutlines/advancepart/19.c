#include <stdio.h>

void combain_sorted_array( int *p, int *q, int *s);

int main()
{	
	int array_a[5]={1,2,4,6,8};
	int array_b[5]={3,5,7,9,10};
	int array_c[10]={};
	int i;

	combain_sorted_array(array_a,array_b,array_c);

	for ( i = 0; i < 10; i++ )
	{
		printf("%3d",array_c[i]);
	}
	printf("\n");
		
	return 0;
}

void combain_sorted_array( int *p, int *q, int *s)
{
	int *p_end = p + 5;
	int *q_end = q + 5;
	
	while( p<p_end && q<q_end )
	{
		if( *p <= *q)
		{
			if( p == p_end - 1 )
			{
				*s = *p;
				//数组a插入完毕；
				//插入数组b就行了
				s++;
				while(q<q_end)
				{
					*s = *q;
					q++;
					s++;
				}
				break;
			}
			*s = *p;
			p++;
			s++;
		}
		else
		// *p>*q
		{
			if (q == q_end -1)
			{
				*s = *q;
				s++;
				while(p<p_end)
				{
					*s = *p;
					p++;
					s++;
				}
			}
			*s = *q;
			q++;
			s++;
		}
	}
}

/**
 *	p 指向数组a，q指向数组b
 *
 *  比较*p与*q的值，较小的数先进入数组，
 *  如果某一个数组达到最后，但是另外一个数组还没结束，那么剩下的数依次插入就可。 
 *
 *
 *
 * */
