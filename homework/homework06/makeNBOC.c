#include <stdio.h>
#include <stdint.h>
#include <arpa/inet.h>  

uint32_t toNetworkByteOrder(uint32_t num) {
    return htonl(num);
}
