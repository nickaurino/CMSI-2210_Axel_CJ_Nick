nasm -fmacho64 modified_comments_paritygen.nasm
gcc -m32 modified_comments_paritygen.o -o modified_comments_paritygen.exe

section .data
    result_msg db 'Parity bit for the given byte (odd parity): ', 0

section .text
    global _start

_start:
    ; Input: rdi = byte of data

    ; Count the number of set bits
    mov rcx, 8                ; Initialize the bit counter
    mov rax, rdi              ; Copy the byte to rax
    xor rdi, rdi              ; Clear rdi to use it as the bit count

parity_calculation_loop:
    test rax, 1               ; Check the least significant bit
    jnz set_bit_found         ; Jump if it's set
    inc rdi                   ; Increment count if bit is set

set_bit_found:
    shr rax, 1                ; Shift right to check the next bit
    loop parity_calculation_loop ; Repeat until all bits are checked

    ; Determine the proper value for the parity bit (odd parity)
    test rdi, 1               ; Check if the bit count is odd
    jnz odd_parity_found      ; Jump if it's odd
    mov rsi, '1'              ; Set parity bit to 1
    jmp print_result

odd_parity_found:
    mov rsi, '0'              ; Set parity bit to 0

print_result:
    ; Print the result
    mov rax, 0x1              ; System call number for sys_write
    mov rdi, 0x1              ; File descriptor 1 is stdout
    mov rdx, 45               ; Length of the message
    lea rsi, [result_msg]    ; Load the message address
    syscall

    mov rax, 0x1              ; System call number for sys_write
    mov rdi, 0x1              ; File descriptor 1 is stdout
    mov rdx, 0x1              ; Length of the parity bit
    lea rsi, [rsi]            ; Load the parity bit address
    syscall

    ; Exit the program
    mov rax, 0x60             ; System call number for sys_exit
    xor rdi, rdi              ; Exit code 0
    syscall
