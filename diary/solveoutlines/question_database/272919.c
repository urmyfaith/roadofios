#include <stdio.h>

int main()
{
	int star_num,row,col;
	scanf("%d",&star_num);
	
	for(row= 0;row < star_num;row++)
	{
		for(col = 0;col < star_num;col++)
		{
			printf("*");
		}
		printf("\n");
	}
	

	return 0;
}
