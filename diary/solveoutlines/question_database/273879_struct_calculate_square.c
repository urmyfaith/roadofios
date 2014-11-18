#include <stdio.h>
struct get_area 
{
	long int  l;
	long int  w;
};

long int calculate_area(long int l,long int w);

int main()
{
	struct get_area area;
	scanf("%ld %ld",&area.l,&area.w);
	printf("%ld",calculate_area(area.l,area.w));
	return 0;
}

long int calculate_area(long int l,long int w)
{
	return l*w;
}
