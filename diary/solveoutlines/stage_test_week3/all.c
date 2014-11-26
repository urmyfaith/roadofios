#include <stdio.h>

#include <string.h>

#include <stdlib.h>

int arrayArray(int array[], int arraySize, int subArray[], int subArraySize)
{
    //上面代码不要动
    
    //your code...
    int i,j,k;
    int flag =-1;
    
    for( i = 0; i < arraySize; i++ )
    {
        j = 0;
        if(array[i]==subArray[0])  //第一个元素相等，继续判断
        {
            k=i;
            while(array[k] == subArray[j] && j<subArraySize)
                k++,j++;
            if(j==subArraySize)
            {
                flag = i;
                break;
            }
        }
    }
    return flag;
    //下面代码不要动
}

int secondMaxItem(int * arr, int n)
{
    //上面代码不要动
    
    //your code...
    int i;
    int flag_max=0,flag;
    
    //找出最大的数
    for( i = 0; i < n ; i++ )
    {
        if( arr[flag_max] < arr[i] )
        {
            flag_max = i;
        }
    }
    //找出次大的数:
    flag = (flag_max+1) % n;
    for(i = 0; i < n; i++ )
    {
        if(i != flag_max)
        {
            if( arr[flag] <  arr[i] )
            {
                flag = i;
            }
        }
    }
    return arr[flag];
    
    //下面代码不要动
}

int sumOfNumbersInString(const char * str)
{
    //上面代码不要动
    
    //your code...
    int sum=0;
    int i=0;
    while(str[i]!='\0')
    {
        sum += str[i]-'0';
        i++;
    }
    return sum;
    
    //下面代码不要动
}

int numbersOfSubtitleInString(const char * str)
{
    //上面代码不要动
    
    //your code...
    int count =0;
    int i =0;
    //   char *s =(char *)str;
    char *s = (char *) malloc(sizeof(char));
    strcpy(s,str);
    
    while( s[i]!= '\0' )
    {
        if ( (s[i]>='a' && s[i]<='z') ||
            (s[i]>='A'&& s[i]<='Z') )
        {
            //putchar(s[i]);
            count++;
        }
        i++;
    }
    return count;
    //下面代码不要动
}

int minCommonMultiple(int * arr, int n)
{
    //上面代码不要动
    
    //your code...
    int i,j,max=arr[0];
    int reback;
    
    //找到最大的数
    for(i = 0; i < n; i++ )
    {
        if(max < arr[i])
            max = arr[i];
    }
    
    //从最大数开始，直到都除尽，break跳出循环
    for( i = max ; ; i++)
    {
        for( j = 0; j < n; j++ )
        {
            if( 0!= i % arr[j])
                break;
        }
        if( j == n)
        {
            reback = i;
            break;
        }
    }
    return reback;
    //下面代码不要动
}

int numOfWorldsInString(const char * str)
{
    //上面代码不要动
    
    //your code...
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
    
    //下面代码不要动
}

int sumOfNumbersInString2(const char * str)
{
    //上面代码不要动
    //your code...
    
    //连续的数字放入数组；
    //最后遍历数组输出和。
    
    int i=0,j=0,k=0;
    char *sum[10]={};
    int reback=0;
    char *p = (char *) malloc(sizeof(char));
    strcpy(p,str);
    // puts(p);
    
    //连续的数字放入数组
    while(p[i]!='\0')
    {
        if(sum[j]==NULL)
            sum[j]=(char *)malloc(sizeof(char));
        if(p[i]>='0' && p[i]<='9')//如果是数字，存入数组
        {
            // printf("%c\n",p[i]);
            sum[j][k]=p[i];
            k++;
        }
        else//如果不是，结束当前的数字进入数组。
        {
            sum[j][k]='\0';
            j++;
            k=0;
        }
        i++;
    }
    for( ;j>=0;j--)
    {
        // puts(sum[j]);
        reback += atoi(sum[j]);
    }
    free(p);
    return reback;
    
    //下面代码不要动
}


int main(void)
{
    
    //第一题
    /*
     
     函数功能：判断某个数组a是否包含数组b，如果包含，则返回b数组在a数组中第一次出现的下标位置，如果没有则返回-1， 假设数组a＝[2,3,4,5,6,5,4,3,2]，b=[5,6,5]， 则b在数组a中，其位置是3
     函数参数，array等价于上面描述的a， arraySize表示array数组的大小，subArray等价于上面描述的b数组，subArraySize表示subArray数组的大小
     返回值：如果a包含b则返回b在a中出现的下标位置，如果a不包含b则返回-1
     */
#if 0
    int a[10]={2,3,4,5,5,6,5,4,3,2};
    int b[3]={5,6,5};
    printf("%d",arrayArray(a,10,b,3));
#endif
    
    //第二题
    /*
     函数功能:传入一个数组和数组的长度，返回数组中第二大数。已知数组中任意两元素不相等。
     函数参数:
     1.arr表示数组的首元素地址
     2.n表示数组的元素个数
     3.返回值是第二大数
     */
#if 0
    int a[10]={1,9,8,7,6,5,4,3,2,1};
    printf("%d",secondMaxItem(a,10));
    
#endif
    
    //第三题
    /*
     已知，传入一个由数字字符组成的字符数组，将每个字符表示的数字求和后，作为返回值。
     //str是传入的数字字符串
     //返回值是数字之和
     //传入:@“12345”
     //返回:15 (即1+2+3+4+5)
     */
#if 0
    char str[10]="12345";
    printf("%d",sumOfNumbersInString(str));
#endif
    
    //第四题
    /*
     统计一个字符串中英语字母的个数
     //str字符串
     //返回值是字母个数
     */
#if 0
    char a[100]="abc123def456";
    printf("%d",numbersOfSubtitleInString(a));
#endif
    //第五题
    /*
     
     知，数组中所有的数都是正整数，返回这些数的最小公倍数
     //arr是数组的首元素地址
     //n是数组的元素个数
     //返回值是数组中所有数的最小公倍数
     */
#if 0
    int array[4]={2,4,8,11};
    printf("%d",minCommonMultiple(array,4));
    
#endif
    //第六题
    /*
     传入一个字符串，已知字符串中连续的字母称为字符，除字母外有其他字符，返回字符串中的单词个数。
     //str 传入的字符串
     //返回值是单词的个数
     */
#if 0
    char arr[100]="hello word12God,is a#girl.\\abcdef";
    printf("%d",numOfWorldsInString(arr));
#endif
    //第七题
    /*
     已知输入的字符串中有多个数字，返回数字之和
     //str 是字符串
     //返回值是数字之和
     //传入 “a12b34c56”
     //返回 102 （即12+34+56之和）
     */
#if 0
    char array[100]="a12b34c56";
    printf("%d",sumOfNumbersInString2(array));
    
#endif
    return 0;
}
