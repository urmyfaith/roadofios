
/*3.计算两个字符串所表示数字的和(15分)
 *  传入:"123"  "459"
 *   返回:582
 *    */
#include <stdio.h>
#include <stdlib.h>
#define NUM 4

int sumOfNumber(const char *s1,const char *s2);

int main(void)
{
	char array1[NUM]="123";
	char array2[NUM]="459";

	printf("%s+%s=%d",array1,array2,sumOfNumber(array1,array2));
	
	return 0;
}

int sumOfNumber(const char *s1,const char *s2)
{
	return atoi(s1)+atoi(s2);
}
