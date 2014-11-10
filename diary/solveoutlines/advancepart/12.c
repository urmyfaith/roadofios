#include <stdio.h>
// f(n+1) = f(n)- (fn/2+1)  = f(n)/2 -1
// fn(n+1) = f(n)/2 -1
// fn(n) = (f(n+1)+1 )*2
// fn(10) = 1

int solve_problem(int n)
{
	int f;
	if( n == 10)
		f = 1;
	else
		f =( solve_problem(n+1)  + 1 )*2;
	return f;
}


int main()
{
	int num;
	num = solve_problem(1);	
	printf("num=%d\n",num);
	return 0;
}
