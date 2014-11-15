#include<stdio.h>

int main(void)
{
//1.
#if 0
	int i;
	for(i=1; i<=100; i++) {
		printf("%3d ",i);
		if(i%10==0)
			printf("\n");
	}
#endif
//2.
#if 0
	char ch;
	scanf("%c",&ch);
	int i,j;
	for(i=0; i<=ch-'A'; i++) {
		for(j=0; j<=2*(ch-'A'); j++) {
			if(j<=ch-'A')
				putchar('A'+j);
			else
				putchar('A'+2*(ch-'A')-j);
		}	
		putchar('\n');
	}
#endif
//3.
#if 0
	int i,j;
	for(i=0; i<='F'-'A'; i++) {
		for(j=i; j<='F'-'A'; j++) {
			putchar('A'+j);	
		}	
		putchar('\n');
	}
#endif
//4.
#if 0
	//求一个数的n次方，即让该数相乘n次即可
	int m,n,mul=1;
	scanf("%d%d",&m,&n);
	int i;
	for(i=0; i<n; i++) {
		mul*=m;	
	}
	printf("%d\n",mul);
#endif
//5.
#if 0
	#define NUM 9
	int arr[NUM],i,tmp;
	for(i=0; i<NUM; i++) {
		scanf("%d",&arr[i]);	
	}
	for(i=0; i<NUM/2; i++) {
		tmp=arr[i];
		arr[i]=arr[NUM-1-i];
		arr[NUM-1-i]=tmp;
	}
	for(i=0; i<NUM; i++) {
		printf("%d ",arr[i]);	
	}
	printf("\n");
#endif
//6.
#if 0
	int i,j,sum;
	for(i=1; i<1000; i++) {
		sum=0;
		for(j=1; j<i; j++) {
			if(i%j==0)
				sum+=j;
		}	 
		if(sum==i)
			printf("%d is perfect number.\n",i);
	}
#endif
//7.	
	#define NUM 5
	int arr[NUM]={2,4,6,10,10};
	int i,j,min=arr[0],max=arr[0];
	for(i=0; i<NUM; i++) {
		if(min>arr[i])
			min=arr[i];
	}
	for(i=min; i>0; i--) {
		for(j=0; j<NUM; j++) {
			if(arr[j]%i!=0)
				break;
		}
		if(j==NUM) {
			printf("%d is the highest common divisor.\n", i);
			break;		
		}
	}
	
	
	for(i=0; i<NUM; i++) {
		if(max<arr[i])
			max=arr[i];
	}
	for(i=max; ; i++) {
		for(j=0; j<NUM; j++) {
			if(i%arr[j]!=0)
				break;
		}
		if(j==NUM) {
			printf("%d is the lowest common multiple.\n", i);
			break;		
		}
	}

	return 0;	
}

