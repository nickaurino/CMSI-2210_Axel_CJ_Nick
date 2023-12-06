#To assemble: nasm-f win32 findGCDfunc.nasm
section .data
    format: db "%d", 0         ; formatted bytes as double
    format2: db 10, 'GCD: %d', 10, 0  ; formatted bytes as string with %d input

section .text
    global calculateGCD     ; Declare the function as global

calculateGCD:
    ; set eax and ecx registers to num1 and num2.
    mov eax, [esp + 4]  ; Load num1 from the stack
    mov ecx, [esp + 8]  ; Load num2 from the stack

    ; euclid's algorithm
    euclids:
        ; if num2 is zero, "return" false
        cmp  ecx, 0
        jz   done     ; answer will always be in eax

        ; else
        xor  edx, edx ; clear edx register (register we use for modulo)
        div  ecx      ; divide eax by ecx
        mov  eax, ecx ; move y into eax
        mov  ecx, edx ; move remainder into ecx
        jmp  euclids  ; start again with (num2, remainder)
        
    done:
        ret           ; return with the GCD in eax
