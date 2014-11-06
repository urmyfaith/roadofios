#include <stdio.h>

#define PI 3.14

int main()
{
	float r;
	float a,b;

	scanf("%f",&r);

	a = PI * r * r;
	b = 2 * PI * r;

	printf("%.2f %.2f",a,b);

	return 0;
}
