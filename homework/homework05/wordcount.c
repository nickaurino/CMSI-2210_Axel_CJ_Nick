#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>

int countWords(FILE *f){
   int count = 0;
   int charcount = 0;
   char ch;
    while (fgetc(f) != EOF) {
        ch = fgetc(f);
        if(!isspace(ch)) {
            charcount++;
        } else if(isspace(ch)) {
            if(charcount>0) {
                count++;
                charcount = 0;
            }
        }
    } return count;
}

int main(int argc, char * args[]) {
    FILE *f = fopen(args[1],"r");
//    if(*f != NULL) {   This causes a compile error with a type mismatch
    if(f != NULL) {
        int count = countWords(f);
        printf("\nTHE NUMBER OF WORDS IN THE FILE WAS %i\n",count+1);
    } else {
       printf("INPUT NEW TEXT FILE");
    }
}
