/*2.判断是否是一个合法的手机号，是返回1，不是返回0 （10分）
 *  要求:手机号以1开头总共有11位 并且手机号中不能有除了数字以外的其他字符
 *   比如: 13812345678 是手机号
 *    188a1234567 不是手机号
 *     01381234567 不是手机号
 *      188123456789 不是手机号
 *       18912345    不是手机号
 *       */
#include <stdio.h>

#define LEN 20

int isPhoneNumberOfString( const char * phoneNumber);
int is_11_digits(const char *phoneNumber);
int is_contain_other_char(const char *phoneNumber);
int is_start_with_1(const char *phoneNumber);

int main(void)
{
	char array[LEN];
	int i=0;
	while ( (array[i]=getchar()) != '\n' )
		i++;
	array[i] = '\0';
	printf("%d",isPhoneNumberOfString(array));

	return 0;
}

int isPhoneNumberOfString( const char * phoneNumber)
{
	int flag=0;
	if(is_11_digits(phoneNumber))
		if(is_start_with_1(phoneNumber))
			if(!is_contain_other_char(phoneNumber))
				flag = 1;
	return flag;
}

int is_11_digits(const char *phoneNumber)
{
	int count=0;
	int i;
	for( i = 0; phoneNumber[i] !='\0'; i++ )
		count++;
	if(count == 11)
		return 1;
	return 0;
}
int is_contain_other_char(const char *phoneNumber)
{
	int i;
	int flag=0;
	for ( i = 0; phoneNumber[i] != '\0'; i++ )
	{
		if( phoneNumber[i]<'0' || phoneNumber[i] >'9')
		{
			flag =1;	
			break;
		}
	}
	return flag;
}
int is_start_with_1(const char *phoneNumber)
{
	int flag = 0;
	if ( phoneNumber[0]=='1')
		flag=1;
	return flag;
}
