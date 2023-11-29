#include <stdio.h>
#include <assert.h>
//nasm -f win32 findGCDfunc.nasm -o findGCDfunc.obj
//gcc gcdFinder.c findGCDfunc.obj -m32 -o gcdFinder.exe
extern int calculateGCD(int, int);

int main() {
    assert(calculateGCD(12,24)==12);
    assert(calculateGCD(24,12)==12);
    assert(calculateGCD(6,1)==1);
    assert(calculateGCD(24,60)==12);
    assert(calculateGCD(3,123)==3);
    printf("WORKED");
}