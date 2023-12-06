#include <stdio.h>
#include <stdint.h>
#include <winsock.h>
#include "NBOC.h"
//gcc makeNBOC.c -o gcdFinder.exe
long int makeNBOC(long int num) {
    if (num != htonl(num)) {
        num = htonl(num);
    } return num;
}
