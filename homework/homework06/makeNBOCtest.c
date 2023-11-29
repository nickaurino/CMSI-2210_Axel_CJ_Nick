#include <stdlib.h>
#include <stdio.h>
#include <winsock.h>
#include "NBOC.h"

//gcc -o makeNBOCtest.exe makeNBOCtest.c makeNBOC.c -l ws2_32 to compile
//need -l ws2_32 to link the 32 bit version of the windows socket library
int main(int args, char *argv[]) {}

long int test(long int num) {
    long int save = makeNBOC(num);
    printf("Host: %ld to Network: %ld",num,save);
    return save;
}
