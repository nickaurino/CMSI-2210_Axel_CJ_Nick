#include <stdio.h>
#include <stdint.h>
#include <winsock.h>
#include "NBOC.h"

long int makeNBOC(long int num) {
    if (num != htonl(num)) {
        num = htonl(num);
    } return num;
}