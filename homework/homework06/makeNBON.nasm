global  _main
extern _test

section .data
    num1: db 0
    num2: db 1000
    num3: db 21023098
    num4: db 12301212
    num5: db 12345678

section .text

_main:
    push ebx

    push num1
    call _test
    add esp, 4

    push num2
    call _test
    add esp, 4

    push num3
    call _test
    add esp, 4

    push num4
    call _test
    add esp, 4

    push num5
    call _test
    add esp, 4

quit:
    pop ebx      ;pop the initially pushed ecx register
    ret          ;return