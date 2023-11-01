#include <stdio.h>
#include <sys/time.h>

int main(void) {
    struct timeval initial, final;
    double timeDiff;

    printf("This program will time how long you can hold your breath. Take a deep breath, then press the 'Enter' key. When you absolutely have to exhale, press the enter key again. The duration will be displayed in minutes and seconds.");
    if(getchar()=='\n') {
        gettimeofday(&initial, NULL);
    }

    if(getchar()=='\n') {
        gettimeofday(&final, NULL);
    }

    timeDiff = (final.tv_sec - initial.tv_sec);

    printf("YOU HELD YOUR BREATH FOR %i MINUTES AND %i SECONDS\n",(int)timeDiff/60,(int)timeDiff%60);
}