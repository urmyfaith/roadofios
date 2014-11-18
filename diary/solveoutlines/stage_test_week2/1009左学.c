#include <stdio.h>
#include <string.h>


int sumofsquare(int n);

int longestwordofstring(const char *str);

void printstring(const char *str);

void printgraph(char ch);

int common(int x ,int y);
int commonmutiple(int *p,int n);

int closetonum(int *arr,int len,int num);

int count_char_in_str(const char *p,char which_char);
char mostcharofstring(const char  *s);

int strtoi(const char *str);

int main()
{
	//第1题
#if 0
	int n;
	n = 4;
	printf("%d\n",sumofsquare(4));
#endif

	//第2题
#if 1
	printf("%d\n",longestwordofstring("we are the world we are the children"));
#endif

	//第3题
#if 0
	printgraph('D');
#endif

	//第4题
#if 0

	int arr[4]={2,3,4,9};
	printf("%d\n",commonmutiple(arr,4));
#endif 
	//第5题
#if 0
	printstring("helloworld");
#endif
	//第6题
#if 0
	int array[10]={1,15,26,37,48,59,68,76,85,94};
	printf("%d\n",closetonum(array,10,14));
#endif

	//第7题
#if 0
	printf("%c\n",mostcharofstring("hello world wwww"));
#endif

	//第8题
#if 0

	printf("%d\n",strtoi("12345"));
#endif

	return 0;
}

//1.从终端输入一个整数n，求从1到n的平方和
//例如:输入的数值是2，得到的结果是5
//	   输入的数值是3，得到的结果是14
//	   输入的数字是4，得到的结果是30
int sumofsquare(int n)
{
	// 4 = 16+9+4+1 = 30
	int i;
	int sum=0;
	for( i = 1; i <= n; i++ )
		sum += i*i;
	return sum;
}              

int longestwordofstring(const char *str)
{
	int count=0;
	char *p = (char *)str;
	int array[100]={};
	int array_str[100]={};
	int i =0,k=0;
	int flag;
	char *q=NULL;

	while('\0' != *p)
	{
		q = p;
		while(' ' != *p  )
		{
			count++;
			p++;
			if( *p == '\0')
				break;
		}
		array[i++]=count;
		array_str[k++]=q-str;
		count = 0;
		if( *p == '\0')
			break;
		else
			p++;
	}
#if 0
	for( i=0; i<10 ; i++)
	{
		printf("array[%d]=%3d\n",i,array[i]);
		printf("array_str[%d]=%d\n",i,array_str[i]);
	}
#endif
	flag = 0;
	for( i=1; array[i]!=0;i++)
	{
		if(array[flag] < array[i] )
		{
			array[flag] = array[i];
			flag = i;
		}
	}
	//printf("max[%d]=%d\n",flag,array[flag]);

	return array_str[flag];
}

void printgraph(char ch)
{
	int row = ch-'A' +1;
	char ch_A='A';
	int i,j;
	char max_char;

	for( i=0; i<row; i++) //输出每行 4行:i = 0,1,2,3
	{
		for(j=0;j<2*row-1;j++) //j = 0,1,2,3,4,5,6
		{	
			max_char='A'+i;
			if(j<i+1)
				putchar(ch_A+j);
			else
			{
				if(j<2*row-1-i)
				{
					putchar(max_char);
				}
				else
				{
					putchar(ch_A+2*row-1-j-1);
				}
			}
		}
		printf("\n");
	}
	for( i=row-2; i>=0; i--) //输出每行 4行:i = 0,1,2,3
	{
		for(j=0;j<2*row-1;j++) //j = 0,1,2,3,4,5,6
		{	
			max_char='A'+i;
			if(j<i+1)
				putchar(ch_A+j);
			else
			{
				if(j<2*row-1-i)
				{
					putchar(max_char);
				}
				else
				{
					putchar(ch_A+2*row-1-j-1);
				}
			}
		}
		printf("\n");
	}
}
int commonmutiple(int *p,int n)
{
	int i;
	int max=common(p[0],p[1]);

	for(i = 1; i < n-1; i++)
	{
		max = common(max,common(p[i],p[i+1]));
	}

	return max;
}

int common(int x ,int y)
{
	int temp;
	int a=x,b=y;
	if(x<y)
	{
		temp = x;
		x = y;
		y = temp;
	}
	while(y!=0)
	{
		temp = x%y;
		x = y;
		y = temp;
	}
	return a*b/x;
}
void printstring(const char *str)
{
	char *p = (char *)str;
	int i,j;
	int length = strlen(p);
	while( *p != '\0' )
	{
		putchar(*p);
		p++;
	}
	p = (char *)str;
	putchar('\n');
	for(i=1;i<length;i++)
	{
		putchar(p[i]);
		for(j=0;j<length-2;j++)
			putchar(' ');
		putchar(p[length-i-1]);
		putchar('\n');
	}
	for(i=0;i<length;i++)
		putchar(p[length-1-i]);
	putchar('\n');
}
int closetonum(int *arr,int len,int num)
{
    
    int i;
    int sub_array[len];
    int min_flag;
    //记录每一个元素与n的差值，
    for ( i = 0; i < len; i++ )
    {
        sub_array[i] = arr[i]-num;
        sub_array[i] = sub_array[i] >0 ? sub_array[i] : -sub_array[i];
    }
    //返回第一个差值最小的下标；
    min_flag = 0;
    for ( i = 1; i < len ; i++)
    {
        min_flag = sub_array[min_flag] > sub_array[i]? i : min_flag;
    }
    
    return arr[min_flag] ;
	
}

// hello world
char mostcharofstring(const char  *s)
{

	char *p = (char *)s;
	int i,max,flag=0;
	int length = strlen(p);

	max =count_char_in_str(p,p[0]);

	for(i = 0; i < length; i++ )
	{
		if( max < count_char_in_str(p,p[i]))
		{
			max = count_char_in_str(p,p[i]);
			flag = i;
		}
	}
	return p[flag];
}

int count_char_in_str(const char *p,char which_char)
{
    int count =0;
    while(*p)
    {
        if(*p==which_char)
        {
            count++;
        }
        p++;
    }
    return count;
}

int strtoi(const char *str)
{
	int i,sum=0;
	char *p = (char *)str;
	int length = strlen(p);

	for(i=0;i<length;i++)
	{
		sum = sum*10 +( p[i] - '0');
	}
	return sum;
}
