#include <stdio.h>

void maopao(char *p,int size);

int main()
{
	int num = 10;
	char array[num];

	printf("array elements:\n");
	for(int i = 0; i < num; i++)
		scanf("%c",&array[i]);

	for(int i = 0; i < num; i++)
		printf("%c\t",array[i]);
	printf("\n");

	maopao(array,num);

	for(int i = 0; i < num; i++)
		printf("%c\t",array[i]);
	printf("\n");

}
/* 冒泡排序：
	假设最大的数是第一个，把第一个和第二个数比较，
	如果第二个数大，交换两个数的值。
*/
void maopao(char *p,int size)
{
    int i,j;
    int NUM = size;
    int flag;
    char *array=p;
	int temp;
    
    for (i = 0; i < NUM-1; i++ )
    {
        flag = i;
        for ( j = i+1; j < NUM ; j++ )
        {
            if(array[flag] > array[j])
                flag = j;
            
        }
        if( flag != i)
        {
            temp = array[i];
            array[i] = array[flag];
            array[flag]= temp;
        }
    }
	return ;
}
