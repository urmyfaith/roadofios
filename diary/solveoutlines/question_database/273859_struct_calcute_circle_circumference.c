
#include <stdio.h>
struct get_area
{
    float r;
    float pi;
};

float calculate_circumference(float pi,float r);

int main()
{
    struct get_area area;
    scanf("%f %f",&area.pi,&area.r);
    printf("%.2f",calculate_circumference(area.pi,area.r));
    return 0;
}

float calculate_circumference(float pi,float r)
{
    return 2*pi*r;
}
