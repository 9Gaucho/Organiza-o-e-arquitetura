section .data
    msg db 'Numeros pares encontrados: ', 10, 0
    msg_len equ $ - msg
    pares db 20 dup('0')  ; espaço para 10 pares + espaço
    newline db 10

section .bss

section .text
    global _start

_start:
    mov rcx, 1
    xor rbx, rbx

loop_start:
    cmp rcx, 10
    jg loop_end

    mov rax, rcx
    and rax, 1
    cmp rax, 0
    jne skip

    mov rax, rcx
    add rax, '0'
    mov [pares + rbx], al
    inc rbx
    mov byte [pares + rbx], ' '
    inc rbx

skip:
    inc rcx
    jmp loop_start

loop_end:
    ; print msg
    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, msg_len
    syscall

    ; print pares
    mov rax, 1
    mov rdi, 1
    mov rsi, pares
    mov rdx, rbx
    syscall

    ; print newline
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1
    syscall

    ; exit
    mov rax, 60
    xor rdi, rdi
    syscall
