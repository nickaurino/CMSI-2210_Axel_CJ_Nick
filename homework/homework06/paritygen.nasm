;To assemble: nasm -f macho64 paritygen.nasm -o paritygen.obj

section .data
    format:   db        "%d", 0   ; format specifier for printf

section .text
    global paritygen

paritygen:
    mov     rdx, rdi            ; rdx holds the address of the byte of data
    mov     r8, 8               ; length of the byte
    mov     r9, 0               ; count of '1's in the byte so far

line:
    movzx   rcx, byte [rdx]    ; load the current bit (0 or 1) into rcx
    add     r9, rcx            ; add the bit value to the count
    inc     rdx                ; advance pointer to the next bit

    ; Continue looping until the end of the byte
    cmp     rdx, [rdi + r8]    ; Compare the current address with the end address of the byte
    jl      line                ; if not at the end, continue looping

    ; Convert the count to odd parity
    test    r9, 1              ; test if count is odd
    jz      evenParity         ; if not odd, jump to evenParity
    jmp     oddParity          ; jump to oddParity

evenParity:
    ; Even parity, print 1
    mov     rdi, 1              ; file handle 1 is stdout
    mov     rsi, 1              ; value to print
    mov     rax, 0              ; clear RAX (necessary for printf)
    jmp     printAndExit

oddParity:
    ; Odd parity, print 0
    mov     rdi, 1              ; file handle 1 is stdout
    mov     rsi, 0              ; value to print
    mov     rax, 0              ; clear RAX (necessary for printf)

printAndExit:
    ; Set up parameters for write syscall
    mov     rax, 0x02000004     ; system call for write
    mov     rdx, 1              ; number of bytes (just the parity bit)
    syscall                     ; invoke operating system to do the write

    ; Exit
    mov     rax, 0x02000001     ; system call for exit
    xor     rdi, rdi            ; exit code 0
    syscall                     ; invoke operating system to exit
