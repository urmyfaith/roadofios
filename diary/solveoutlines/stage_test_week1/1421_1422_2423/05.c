/*5.查找子串出现次数(15分)
 *
 *  // 返回字符串s中出现子串substring的次数
 *   */
#include <stdio.h>
#include <string.h>

#define LEN 100

size_t countOfSubstring(const char *s,const char *substring);


int main(void)
{
	char array1[LEN]="GodissagirlGodisagirlis";
	char array2[LEN]="is";

	printf("%ld\n",countOfSubstring(array1,array2));



}

size_t countOfSubstring(const char *s,const char *substring)
{
	int count=0;
	int i,j,k;
	int length_substring = strlen(substring);

	for( i =  0; s[i] != '\0'; i++ )
	{
		if( substring[0]==s[i])
		{
			k=i+1;
			j=1;
			while ( substring[j]!='\0' && (substring[j] == s[k]))
				j++,k++;
			if(j==length_substring)
				count++;
		}
	}
	return count;
}
