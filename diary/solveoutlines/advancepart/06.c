// 1,2,3,4输出所有由这4个数字组成的不含重复数字的三位数？

void three_digits_num(int a,int b ,int c ,int d);

#include <stdio.h>

int main()
{
    int a = 1,b = 2,c = 3,d = 4;
    
    three_digits_num(a,b,c,d);
    
    return 0;
}
void three_digits_num(a,b,c,d)
{
    int sum = 0;
    int array1[4]={a,b,c,d};
    int array2[3]={};
    int array3[2]={};
    int temp = 0;
    int i,j;
    int count =0;
    
    for (i = 0;i < sizeof(array1)/sizeof(int); i++)
    {
        //array[i] 取出了一位；
        //将这个数从数组删除，创建一个新数组；
        temp = array1[i];//删除取出的百位数
        int n =0;
        for (int k = 0; k < 4; k++ )
        {
            if( array1[k] != temp)
            {
                array2[n] = array1[k];
                n++;
            }
        }
        //array2[3]完成赋值
        
        for( j = 0;j < 3; j++)
        {
            //取出array2[j], 放在十位；
            temp = array2[j]; //删除取出的十位数 。
            int n = 0;
            for(int m = 0; m < 3; m++)
            {
                if (array2[m] != temp)
                {
                    array3[n] = array2[m];
                    n++;
                }
            }
            //array3[2] 完成赋值；
            
            for ( int m = 0; m < 2;m++)
            {
                //取出个位数；
                sum = array1[i]*100 + array2[j]*10 +  array3[m]*1;
                printf("%d\t由%d-%d-%d组成\t%d\n",++count,array1[i],array2[j],array3[m],sum);
            }
        }
    }
}

#if 0

从四位数中取出一位，放在百位；（取出一个数，相当于一个循环，）
从剩下的三位数中取出一位，放在十位；（剩下的数，创建一个不包含刚才的取出数的新数组。）
从剩下的两位数中取出一位，放在各位；

相加之后输出。

#endif
