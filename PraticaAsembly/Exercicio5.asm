section .data
    msg_p db 'Pares: ', 0
    msg_p_len equ $ - msg_p
    msg_i db 'Impares: ', 0
    msg_i_len equ $ - msg_i
    res_p db '0', 10
    res_i db '0', 10
    res_len equ 2

section .text
    global _start

_start:
    mov rcx, 1
    xor rbx, rbx  ; pares
    xor rdx, rdx  ; ímpares

loop_start:
    cmp rcx, 20
    jg loop_end

    mov rax, rcx
    and rax, 1
    cmp rax, 0
    jne inc_impar

    inc rbx
    jmp next

inc_impar:
    inc rdx

next:
    inc rcx
    jmp loop_start

loop_end:
    ; Conversão para ASCII
    mov rax, rbx
    add rax, '0'
    mov [res_p], al

    mov rax, rdx
    add rax, '0'
    mov [res_i], al

    ; Imprime pares
    mov rax, 1
    mov rdi, 1
    mov rsi, msg_p
    mov rdx, msg_p_len
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, res_p
    mov rdx, res_len
    syscall

    ; Imprime ímpares
    mov rax, 1
    mov rdi, 1
    mov rsi, msg_i
    mov rdx, msg_i_len
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, res_i
    mov rdx, res_len
    syscall

    ; Exit
    mov rax, 60
    xor rdi, rdi
    syscall
