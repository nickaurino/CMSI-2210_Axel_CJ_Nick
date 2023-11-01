#include <stdio.h>
#include <stdlib.h>

int main(int argc, char * args[]) {
    int num = atoi(args[1]);
    if(num>2) {
        for(int i=2; i<=num; i++) {
            for(int j=2; j<=num; j++) {
                int val = i*j;
                printf("    %i ",i);
                printf("\n");
                printf(" x  %i",j);
                printf("\n");
                printf("-------");
                printf("\n");
                printf("    %i",val);
                printf("\n");
                printf("\n");
            }
        }
    } else {
        printf("Try again with a smaller number");
        printf("\n");
    }
}