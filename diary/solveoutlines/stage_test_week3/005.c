#include <stdio.h>

int minCommonMultiple(int * arr, int n)
{
//上面代码不要动

//   //your code...
	int i,j,max=arr[0];
	int reback;

	//找到最大的数
	for(i = 0; i < n; i++ )
	{
		if(max < arr[i])
			max = arr[i];
	}

	//从最大数开始，直到都除尽，break跳出循环
	for( i = max ; ; i++)
	{
		for( j = 0; j < n; j++ )
		{
			if( 0!= i % arr[j])
				break;
		}
		if( j == n)
		{
			reback = i;
			break;
		}
	}
	return reback;

   //下面代码不要动
}

int main(void)
{
	int array[4]={2,4,8,10};
	printf("%d",minCommonMultiple(array,4));
	return 0;
}
