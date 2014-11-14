//甲队 ABCsanren，乙队XYZ三人，A不和X比，C不和X，Z比。
// 每队各出一人
// 比赛名单

#include <stdio.h>

int my_strlen(char *p);

void print_list(char *p,char *q);

int main()
{
	char arr_a[4]="ABC";
	char arr_b[4]="XYZ";
//	printf("%d\n",my_strlen(arr_a));
	print_list(arr_a,arr_b);
	return 0;
}
void print_list(char *p,char *q)
{
	int size_p = my_strlen(p);
	int size_q = my_strlen(q);
	int i,j;
	for( i = 0; i < size_p; i++)
	{
		for( j = 0; j < size_q; j++)
		{
#if 1
			if(p[i]=='A' && q[j]=='X')
			{
				continue;
			}
			if(p[i]=='C' && (q[j]=='X' || q[j]=='Z'))
			{
				continue;
			}
#endif
			printf("%c-->%c\n",p[i],q[j]);
		}
	}
	printf("\n");
}
int my_strlen(char *p)
{
	int count=0;
	while(*p!='\0')
	{
		p++;
		count++;
	}
	return count;
}
