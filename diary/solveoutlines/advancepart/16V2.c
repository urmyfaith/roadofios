#include<stdio.h>
#define NUM 10
int main(void)
{
    int arr[NUM]={3,8,11,44,55,66,77,99, 100,120};
    int i,num,sta,end,mid;
    scanf("%d",&num);
    
    if(num<arr[0]||num>arr[NUM-1])
        printf("%d 不在数组当中.\n",num);
    else {
        if(num==arr[0]||num==arr[NUM-1]) {
            printf("%d 在数组当中.\n",num);
            return 0;
        }
        sta=0;
        end=NUM-1;
        for(i=0; sta!=end; i++) {
            mid=(sta+end)/2;
            if(arr[mid]>num) {
                sta=sta;
                end=mid;
            }else if(arr[mid]<num) {
                sta=mid+1;
                end=end;
            }else {
                printf("%d 在数组当中.\n",num);
                break;
            }
        }
        if(sta==end)
            printf("%d 不在数组当中.\n",num);
    }
    
    return 0;
}

