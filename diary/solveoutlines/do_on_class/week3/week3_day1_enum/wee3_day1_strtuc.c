#include <stdio.h>

#define NUM 10
struct student
{
	int NO;
	char name[NUM];
	int math;
}stu0,stu[10],*p;

typedef struct
{
	int NO;
	char name[NUM];
	int math;
}STU;

int main(void)
{
	struct student stu1;
	STU sut2;
	return 0;
}
