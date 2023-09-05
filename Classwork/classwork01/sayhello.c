#include <stdio.h>
#include <stdlib.h>

int main(int argc, char * argv[]) {
    double degreesF;
    char input[25];
    printf("Enter a temp in degrees Fahrnenheit: ");
    degreesF = atof(gets(input));
    printf("%10.3f degrees F is %10.3f degrees C.", degreesF, (((degreesF-32.0)*5)/9));
    exit(0);
}