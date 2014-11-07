#include <stdio.h>

#define NUM 5

int main()
{
    int array[NUM] = {1,2,3,4,5};
    int i,j,temp ;
    int shift_number = 2;
    
#if 0
    for ( i = 0; i < NUM ; i++ )
    {
        scanf("%d",&array[i]);
    }
#endif
    for ( i = 0; i < NUM ; i++ )
    {
        printf("%d",array[i]);
    }
    printf("\n");
    
    for( j = 0; j < shift_number ; j++ )
    {
        temp = array[NUM-1];
        for ( i = NUM -1; i > 0 ; i-- )
        {
            array[i] = array[i-1];
        }
        array[0] = temp;
    }
    
    for ( i = 0; i < NUM ; i++ )
    {
        printf("%d",array[i]);
    }
    printf("\n");
    return 0;
}

// 1 2 3 4 5 6
//   1 2 3 4 5
// 0 1 2 3 4 5 --下标
