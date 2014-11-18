#include <stdio.h>
struct get_area 
{
	float r;
	float pi;
};

float calculate_area(float pi,float r);

int main()
{
	struct get_area area;
	scanf("%f %f",&area.pi,&area.r);
	printf("%.2f",calculate_area(area.pi,area.r));
	return 0;
}

float calculate_area(float pi,float r)
{
	return pi*r*r;
}
