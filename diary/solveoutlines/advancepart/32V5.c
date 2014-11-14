#include <stdio.h>

int func(int n,int m,int i);

int main(void)
{
    int n,m;
    int i;
    
    printf("input n and m in format: n,m\n");
    scanf("%d,%d",&n,&m);
    
    for( i = 1; i <= n; i++)
        printf("第%3d次出环：%3d\n",i,func(n,m,i));
    return 0;
}
int func(int n,int m,int i)
{
    
    if( i == 1)
        return (n+m-1) % n;
    else
        return (func(n-1,m,i-1) + m) % n;
}
/*
 0	1	2	3	4	5	6	7		n=8,m=3
 0	1	3	4	5	6	7			第1个人出环
 ⬇︎
 3	4	5	6	7	0	1	—	a
 ⬇︎
 0	1	2	3	4	5	6	—	b	(b+3)%8=a
 0	1	3	4	5	6				第2个人出环
 ⬇︎
 3	4	5	6	0	1	—	—	c
 ⬇︎
 0	1	2	3	4	5	—	—	d	(d+3)%7=c
 0	1	3	4	5					第3个人出环
 ⬇︎
 3	4	5	0	1	—	—	—	e
 ⬇︎
 0	1	2	3	4	—	—	—	f	(f+3)%6=e
 0	1	3	4						第4个人出环
 ⬇︎
 3	4	0	1	—	—	—	—	g
 ⬇︎
 0	1	2	3	—	—	—	—	h	(h+3)%5=g
 0	1	3							第5个人出环
 ⬇︎
 3	0	1	—	—	—	—	—	i
 ⬇︎
 0	1	2	—	—	—	—	—	j	(j+3)%4=i
 0	1								第6个人出环
 ⬇︎
 0	1	—	—	—	—	—	—	k
 ⬇︎
 0	1	—	—	—	—	—	—	l	(l+3)%3=k
 1									第7个人出环
 ⬇︎
 1	—	—	—	—	—	—	—	m
 ⬇︎
 0	—	—	—	—	—	—	—	n	(n+3)%2=m
 -									第8个人出环
 7个人中第7次出环的编号，经过转换就能得到8个人第8次出环的编号
 
 设f(n,m,i)为n个人的环，报数为m，第i个人出环的编号，则f(8,3,8)是我们要的结果
 
 (8+3-1 )% 8 = 2 只有2个人的时候，
 
 第一个人先出环，剩余第二人，
 第二次第二个人出环；
 
 f(n,m)= ( f(n-1,m,i-1)+k )%n
 
 f(8,3,8)=(f(7,3,7)+k)%8
 f(7,3,7)=(f(6,3,6)+k)%7
 ...
 f(2,3,2)=(f(1,3,1)+k)%2
 
 
 f(2,3,1)=(2+3-1)%*2=0
 */
