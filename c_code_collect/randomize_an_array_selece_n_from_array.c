#include <stdio.h>
#include <stdlib.h>
#include <time.h>
/*
 * run this program with 3 arguments.
 * ./randomize lower upper num
 * lower: the lower bound
 * upper: the upper bound
 * num: the number of members you want to select
 * lower<upper, num<=upper-lower+1
 * For example:
 * ./randomize 10 20 5
 * means: randomize 5 numbers from 10 to 20. 
 */
void swap(int *, int *);
int main(int argc, char *argv[])
{
    unsigned int seed;
    seed = (unsigned)(time(NULL));
    srand(seed);

    int upper, lower, num;
    lower = atoi(argv[1]);
    upper = atoi(argv[2]);
    num = atoi(argv[3]);

    int a[upper-lower+1], i, array[num];
    for (i=0; i<(upper-lower+1); i++) a[i]=i+lower;
    for (i=(upper-lower); i>0; i--)  swap(&a[i], &a[rand()%(i+1)]);
    for (i=0; i<num; i++)
    {
        array[i]=a[i];
        printf("%d ", array[i]);
    }
    putchar('\n');

    return 0;
}
void swap(int *x, int *y)
{
    int tmp;
    tmp = *x;
    *x = *y;
    *y = tmp;
}
