#include <stdio.h>

int main()
{
	int x,y,z;
	int max,mid,min;
	scanf("%d%d%d",&x,&y,&z);

	max = x>y?x:y;
	max = max>z?max:z;

	min = x<y?x:y;
	min = min<z?min:z;
	
	mid = x + y + z - min - max;
	printf("%d %d %d",max,mid,min);

	return 0;
}
