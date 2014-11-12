#include <stdio.h>

int main()
{
	int a = 5;
	int b = 6;
	int * const p = &a;
	//const  修饰p，表示指针变量p的值（指针指向）不能修改。
	//					但是可以修改*p的内容。
	p = &b;
	
	return 0;
}
/*
 *
 * week2_day3_contsV2.c:10:4: error: read-only variable is not assignable
 *         p = &b;
*/

const int **q;
int const **q;
int * const *q;
int ** const q;
int const * const * const q;

