#include <stdio.h>
#include <string.h>
#include <stdlib.h>


int numOfWorldsInString(const char * str)
{
//上面代码不要动
	int count = 0;
	char *word;
	char *sep = " ,./;:'\"\\!@#$%^*1234567890";
	char *array = (char *) malloc(sizeof(char));
	strcpy(array,str);

	for( word = strtok(array,sep); word; word = strtok(NULL,sep))
	{
		count++;
	}
	return count;
	

   //your code...
   //下面代码不要动
}

int main(void)
{
	char arr[100]="hello word12God,is a#girl.\\abcdef";

	printf("%d",numOfWorldsInString(arr));

	return 0;
}
