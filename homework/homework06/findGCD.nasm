#To compile: nasm-f win32 findGCD.nasm

global  _main
extern _scanf, _printf

section .data
    format: db "%d", 0 ;formatted bytes as double
    format2: db 10, 'GCD: %d', 10, 0 ;formatted bytes as string with %d input
    prompt: db 10, "Enter a number:", 10, 0 ;formatted bytes as string
    num1: db 0 ;formatted bytes as number 0
    num2: db 0 ;formatted bytes as number 0

section .text

_main:
    push ecx     ;push ecx value onto stack

    ;code to set num1 through user input

    ;prinf call requires prompt parameter, optional values as other parameters
    push prompt  ;push prompt to enter number
    call _printf ;call printf with 1 parameter
    add esp, 4   ;go 4 bits down the stack (4 per parameter)

    ;scanf call requires end location, format parameters
    push num1    ;push num1 to stack
    push format  ;push format
    call _scanf  ;call scanf with 2 parameters
    add esp, 8   ;go 8 bits down the stack (4 per parameter)

    ;repeat previous section to set num2
    push prompt
    call _printf
    add esp, 4

    push num2
    push format
    call _scanf
    add esp, 8

;set eax and ecx registers to num1 and num2. These will both be values since they were set in main.
start:
    mov eax, [num1]
    mov ecx, [num2]

;euclids algorithm
euclids:
    ;if num2 is zero, "return" false
    cmp  ecx, 0
    jz   done     ;answer will always be in num1

    ;else
    xor  edx, edx ;clear edx register (register we use for modulo)
    div  ecx      ;divide rax by num2
    mov  eax, ecx ;move y into first parameter
    mov  ecx, edx ;move remainder into second paramter
    jmp  euclids  ;start again with (num2, remainder)

done:
    push eax     ;push eax to stack (set to num1 after return)
    push format2 ;push return format
    call _printf ;call printf
    add esp, 8   ;go 8 bits down in stack (4 per parameter)


quit:
    pop ecx      ;pop the initially pushed ecx register
    ret          ;return
