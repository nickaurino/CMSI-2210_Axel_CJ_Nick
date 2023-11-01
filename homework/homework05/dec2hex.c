#include <stdio.h>
#include <stdlib.h>

char getVal(int arg) {
    char list[16] = {'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'};
    return (list[arg]);
}

void createArray(char *list, int size) {
    for(int i=0; i<size; i++) {
        list[i] = '0';
    }
}

int main(int argc, char * args[]) {
    int num = atoi(args[1]);
    int size = atoi(args[2]);
    int arraySize = size/4;
    char val = '0';

    char list[arraySize];
    createArray(list,arraySize);

    if(size==32 || size==64) {
        for(int i=arraySize; i>0; --i) {
            val = getVal(num%16);
            list[i] = val;
            num/=16;
        }

        for(int i=0; i<arraySize; i++) {
            printf("%c",list[i]);
        }
    } else {
        printf("%i",num);
    }
}