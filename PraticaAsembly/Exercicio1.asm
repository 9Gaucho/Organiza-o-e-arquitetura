section .data
    msg db 'Quantidade de numeros pares: ', 0
    msg_len equ $ - msg
    result db '0', 10
    result_len equ $ - result

section .text
    global _start

_start:
    mov rcx, 1
    mov rbx, 0

loop_start:
    cmp rcx, 14
    jg loop_end

    mov rax, rcx
    and rax, 1
    cmp rax, 0
    jne skip
    inc rbx

skip:
    inc rcx
    jmp loop_start

loop_end:
    mov rax, rbx
    add rax, '0'
    mov [result], al

    ; print msg
    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, msg_len
    syscall

    ; print result
    mov rax, 1
    mov rdi, 1
    mov rsi, result
    mov rdx, result_len
    syscall

    mov rax, 60
    xor rdi, rdi
    syscall
