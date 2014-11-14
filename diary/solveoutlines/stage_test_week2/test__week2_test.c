#include<stdio.h>
#include<stdlib.h>
#include<string.h>
//1.从终端输入一个整数n，求从1到n的平方和
//例如:输入的数值是2，得到的结果是5
//	   输入的数值是3，得到的结果是14
//	   输入的数字是4，得到的结果是30
int sumofsquare(int n)
{
	int i,sum=0;
	for(i=1; i<=n; i++) {
		sum+=i*i;	
	}	
	return sum;	
}              

//2.从终端输入一句话，找出这句话内最长的单词，并把其首字符下标返回。每个单词以一个空格隔开
//例如:we are the world we are the chileren
//    得到的结果是children首个字符c的下标
int longestwordofstring(const char *str)
{
	int i,j,cnt,num=0,flag=0;
	for(i=0; str[i]!='\0'; i++) {
		if(str[i]!=' ') {
			cnt=0;
			for(j=i; str[j]!=' '&&str[j]!='\0'; j++)
				cnt++;
		}	
		if(num<cnt) {
			num=cnt;
			flag=i;	
		}
	}
	return flag;	
}

//3.传入一个字母，打印对应图形
//例如:输入的是字符'D'
//AAAAAAA
//ABBBBBA
//ABCCCBA
//ABCDCBA
//ABCCCBA
//ABBBBBA
//AAAAAAA
void printgraph(char ch)
{
	int i,j;
	int n=ch-'A'+1;
	for(i=0; i<n; i++) {
		for(j=0; j<2*n-1; j++) {
			if(i==0||j==0||j==2*n-2)
				putchar('A');
			else {
				if(j<=i)
					putchar('A'+j);
				else if(j>i&&j<2*n-2-i)
					putchar('A'+i);
				else 
					putchar('A'+2*n-2-j);
			}		
		}	
		putchar('\n');
	}	
	for(i=n-2; i>=0; i--) {
		for(j=0; j<2*n-1; j++) {
			if(i==0||j==0||j==2*n-2)
				putchar('A');
			else {
				if(j<=i)
					putchar('A'+j);
				else if(j>i&&j<2*n-2-i)
					putchar('A'+i);
				else 
					putchar('A'+2*n-2-j);
			}		
		}	
		putchar('\n');
	}	
}

//4.把该数组传入函数，返回数组中最小公倍数
//p是数组首地址，n是数组元素个数,返回值是数组所有元素的最小公倍数
int commonmutiple(int *p,int n)
{
	int max=p[0],i,j,w;
	for(i=0; i<n; i++) {
		if(max<p[i])
			max=p[i];	
	}
	for(i=max; ;i++) {
		for(j=0; j<n; j++) {
			if(i%p[j]!=0)
				break;	
		}	
		if(j==n) {
			w=i;
			break;
		}
	}

	return w;
}

//5.根据传入的字符串答应下述图形
//例如:传入"helloworld"
//打印
//helloworld
//e        l
//l        r
//l        o
//o        w
//w        o 
//o        l
//r        l
//l        e
//dlrowolleh

void printstring(const char *str)
{
	int i,j;
	int len=strlen(str);
	for(i=0; i<len; i++) {
		for(j=0; j<len; j++) {
			if(i==0)
				putchar(str[j]);
			else if(i<len-1) {
				if(j==0)
					putchar(str[i]);
				else if(j==len-1)
					putchar(str[len-1-i]);
				else
					putchar(' ');	
			}else		
				putchar(str[len-1-j]);
		}	
		putchar('\n');
	}	
}

//6.找出数组中与指定值最接近的数
//arr数组首元素地址
//len数组元素个数
//n指定的数
//返回值是最接近指定的数的元素
int closetonum(int *arr,int len,int num)
{
	int i,min,gap,var;
	min=(arr[i]-num)>0?arr[i]-num:num-arr[i];
	var=arr[0];
	for(i=0; i<len; i++) {
		gap=arr[i]-num>0?arr[i]-num:num-arr[i];
		if(min>gap) {
			min=gap;
			var=arr[i];
		}	
	}
	return var;
}

//7.返回字符串中出现次数最多的字符
//s是字符串
//返回值是出现最多次的字符
char mostcharofstring(const char *str)
{
	char max,cnt;
	int i,j,flag=0;
	for(i=0; str[i]!='\0'; i++) {
		cnt=1;
		for(j=i+1; str[j]!='\0'; j++) {
			if(str[i]==str[j]) {
				cnt++;	
			}
		}
		if(i==0)	
			max=cnt;
		if(max<cnt) {
			max=cnt;
			flag=i;
		}
	}

	return str[flag];
}

//8.把一个数字字符串转换成对应的整数，并以返回值的形式返回
//例如:str[3]="12345";
//返回值是12345
int strtoi(const char *str)
{
	int sum=0;
	int i=0;
	while(str[i]!='\0') {
		sum=sum*10+str[i]-'0';
		i++;	
	}
	return sum;
}


int main(void)
{
// ONE
#if 0
	int n;
	scanf("%d",&n);
	printf("1^2+2^2+...+%d^2=%d\n",n,sumofsquare(n));
#endif

// TWO
#if 0
	char str[1024]={};
	int i=0;
	while((str[i]=getchar())!='\n')
	{
		i++;
	}
	str[i]='\n';
	
	printf("%d\n",longestwordofstring(str));
#endif

// THREE
#if 0
	int ch;
	ch = getchar();
	printgraph(ch);
#endif


// FOUR
#if 0
	int size;
	printf("input array size:\n");
	scanf("%d",&size);

	int *p = malloc(sizeof(int)*size);
	int i;
	for(i=0; i<size; i++)
	{
		printf("\ninput array[%d]=\t",i);
		scanf("%d",&p[i]);
	}
	printf("\ncommom number is \t%d\n",commonmutiple(p,size));
#endif

// FIVE
#if 0
	char str[1024]={};
	int i=0;
	while((str[i]=getchar())!='\n')
	{
		i++;
	}
	str[i]='\0';
	printstring(str);

#endif

// SIX
#if 0
	int size;
	printf("input array size:\n");
	scanf("%d",&size);

	int *p = malloc(sizeof(int)*size);
	int i;
	for(i=0; i<size; i++)
	{
		printf("\ninput array[%d]=\t",i);
		scanf("%d",&p[i]);
	}
	printf("\ninput number you want to find in array:\n");
	int num;
	scanf("%d",&num);
	printf("%d\n",closetonum(p,size,num));

#endif

// SEVEN
#if 0
	char str[1024]={};
	int i=0;
	while((str[i]=getchar())!='\n')
	{
		i++;
	}
	str[i]='\0';
	printf("\n%c\n",mostcharofstring(str));

#endif

// EIGHT
#if 0
	char str[1024]={};
	int i=0;
	while((str[i]=getchar())!='\n')
	{
		i++;
	}
	str[i]='\0';

	printf("\n%d\n",strtoi(str));
#endif
	return 0;
}
