#include <stdio.h>
#include <string.h>

int main()
{
    char str[] = "Life is like, a box of chocolate, you never, know what you're, gonna get";
    char delims[] = ",";
    char *result;

    for( result = strtok(str, delims); result != NULL; result = strtok(NULL, delims))
        printf("%s \n", result);
    return 0;
}