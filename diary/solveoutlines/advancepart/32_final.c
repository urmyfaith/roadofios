#include <stdio.h>

int main(void)
{
	int n,m,i;
	scanf("%d%d",&n,&m);
	int arr[n];
	for(i=0; i<n; i++) {
		arr[i]=0;	
	}
	int cnt=1,j,count=n;

	while(count!=1) {	
		for(i=0; i<n; i++) {
			if(arr[i]!=1) {
				if(cnt==m) {
					arr[i]=1;
					count--;
					cnt=1;
				}
				else
					cnt++;
			}
		}
	}


	for(i=0; i<n; i++) {
		printf("%2d ",arr[i]);	
	}
	putchar('\n');

	return 0;	
}

