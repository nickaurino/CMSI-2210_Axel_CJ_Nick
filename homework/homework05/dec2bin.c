#include <stdio.h>
#include <stdlib.h>


int main(int argc, char * args[]) {
    int num = atoi(args[1]);
    int save = num;
    int binNum[32];
    for(int i=0; i<32; i++) {
        binNum[i] = num%2;
        num = num/2;
    }

    printf("%i to binary is ",save);
    for(int i=32; i>0; i--) {
        printf("%i",binNum[i]);
    }

    printf("%i",binNum[0]);
}