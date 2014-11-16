#include <stdio.h>
#include <string.h>

int main()
{
    char str[] = "Life is like, a box of chocolate, you never, know what you're, gonna get";
    char delims[] = ",";
    char *result;

    result = strtok( str, delims );
    while(result != NULL){
        printf("%s \n", result);
        result = strtok( NULL, delims);
    }
    return 0;
}