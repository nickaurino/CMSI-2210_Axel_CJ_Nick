#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>


uint32_t toNetworkByteOrder(uint32_t num);

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <number>\n", argv[0]);
        return 1;
    }

    uint32_t num = strtoul(argv[1], NULL, 10);
    uint32_t nboNum = toNetworkByteOrder(num);

    printf("Original Number: %u\n", num);
    printf("Network Byte Order: %u\n", nboNum);

    return 0;
}
