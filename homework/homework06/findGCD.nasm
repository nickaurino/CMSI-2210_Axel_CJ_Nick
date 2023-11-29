;to run
;nasm -felf64 findGCD.nasm && ld findGCD.o && ./a.out
global  _start
extern scanf, printf

section .data
    format db "%i", 10
    prompt db "Enter a number:", 0
    num1 db 0
    num2 db 0

section .bss
    buffer resb 10

section .text


_start:
    mov  rdi, format
    mov  rsi, num1
    call scanf

    mov  rdi, format
    mov  rsi, num2
    call scanf

    call euclids
    mov  rdi, format
    mov  [num1], rsi
    call printf

euclids:
    mov  rax, [num1] ;move value in num1 to rax
    mov  rcx, [num2]
    cmp  rcx, 0
    jz   done        ;answer will always be in num1
    div  rcx         ;divide rax by num2
    mov  [num1], rcx ;move y into first parameter
    mov  [num2], rdi ;move remainder into second paramter
    call euclids

done:
    ret