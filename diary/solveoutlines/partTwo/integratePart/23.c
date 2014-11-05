#include <stdio.h>

int main(void)
{
	int num,sum,i,j,repeat_num,each_num;
	each_num = 0;
	repeat_num = 0;
	sum = 0;
	
	printf("please input number a:\n");
	scanf("%d",&num);

	printf("please input repete number:\n");
	scanf("%d",&repeat_num);
	
	for(i=1;i<=repeat_num;i++)
	{
		for(j=0;j<i;j++)	//create eachNumber to add  2+22+222+222
		{
			each_num = num + each_num*10;
		//	printf("each_num=%d\n",each_num);
		}
		sum = sum + each_num;
		//printf("sum=%d\n",sum);
		each_num = 0;
	}
	printf("num=%d,repeat_num=%d,sum=%d\n",num,repeat_num,sum);
	return 0;
}
