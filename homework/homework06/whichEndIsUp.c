#include <stdio.h>
//gcc whichEndIsUp.c -o whichEndIsUp.exe
int main() {
    union {
        int num;
        char bytes[sizeof(int)];
    } testUnion;

    testUnion.num = 0x1;

    if (testUnion.bytes[0] == 1) {
        printf("This system is Little-Endian.\n");
    } else {
        printf("This system is Big-Endian.\n");
    } return 0;
}
