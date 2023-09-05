#include <stdio.h>
#include <stdlib.h>

int main(int argc, char * argv[]) {
    char input[25];
    char name[25];
    printf("Enter your name: ");
    scanf("%s", name);
    printf("Hello %s", name);
    exit(0);
}