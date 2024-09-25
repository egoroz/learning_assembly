section .data
    text1 db "Hello, assebly language!",10,0
    text2 db "Are you there?",10,0
section .text
%macro exit 0
    mov rax, 60
    mov rdi, 0
    syscall
%endmacro

    global _start
_start:
    mov rax, text1
    call _print

    mov rax, text2
    call _print

    exit

_print:
    push rax
    mov rbx, 0
_printLoop:
    inc rax
    inc rbx
    mov cl, [rax]
    cmp cl, 0
    jne _printLoop

    mov rax, 1
    mov rdi, 1
    pop rsi
    mov rdx, rbx
    syscall
    ret
