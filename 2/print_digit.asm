section .data
    digit db 0,10
section .text
%macro exit 0
    mov rax, 60
    mov rdi, 0
    syscall
%endmacro

%macro printDigit 1
    mov rax, %1
    call _printDigit
%endmacro

    global _start
_start:
    printDigit 7
    printDigit 9
    printDigit 0

    exit

_printDigit:
    add rax, 48
    mov [digit], al
    mov rax, 1
    mov rdi, 1
    mov rsi, digit
    mov rdx, 2
    syscall
    ret
