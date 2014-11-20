//4.实现函数，将数字转成一个字符串(15)
////a 是整型数字
////buf 是数字转成字符串存储的位置
////必须支持负数

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void itoa(char * buf, int a);

int main(void)
{
	int num;
	scanf("%d",&num);

	char *buf = (char *) malloc(sizeof(char));
	itoa(buf,num);
	puts(buf);

	return 0;
}

void itoa(char *buf ,int a)
{
	char array[100];
	int i=0,length;
	int temp,flag;
	flag = a > 0 ? 1:(-1);
	temp = a > 0 ? a: -a;

	//取出每一位，存入数组
	while(temp)
	{
		array[i] = temp%10 + '0';
		temp /= 10;
		i++;
	}
	array[i]='\0';

	//数组逆序排列
	length = strlen(array);
	for( i =0; i < length/2; i++ )
	{
		temp = array[length-1-i];
		array[length-1-i] = array[i];
		array[i] = temp;
	}

	//如果是负数，添加一个负号
	if(flag == -1)
	{
		array[length+1]='\0';
		for( i = length; i > 0; i-- )
		{
			array[i]=array[i-1];
		}
		array[0]='-';
	}
	//保存返回值
	strcpy(buf,array);
}
