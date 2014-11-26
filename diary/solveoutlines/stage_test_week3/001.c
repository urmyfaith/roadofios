#include <stdio.h>

int arrayArray(int array[],int arraySize,int subArray[],int subArraySize)
{
	int i,j,k;
	int flag =-1;

	for( i = 0; i < arraySize; i++ )
	{
		j = 0;
		if(array[i]==subArray[0])  //第一个元素相等，继续判断
		{
			k=i;
			while(array[k] == subArray[j] && j<subArraySize)
				k++,j++;
			if(j==subArraySize)
			{
				flag = i;
				break;
			}
		}
	}
	return flag;
}

int main(void)
{
	int a[10]={2,3,4,5,5,6,5,4,3,2};
	int b[3]={5,6,5};
	printf("%d",arrayArray(a,10,b,3));
	return 0;
}
