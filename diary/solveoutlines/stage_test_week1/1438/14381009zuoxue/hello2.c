#include	<stdio.h>
int  main(void)
{	
	int min,max,temp2,temp1,mul;
	
    if(min>max)
    {	temp1 = max;
        max = min;
        min = temp1; 
    }
    mul = min * max;  
    while( 0 != min)
    {
        temp2 = max %min;
        max = min;
        min = temp2;
    }
   printf("%d,%d",max,mul/max); 
	return 0;
    
}
