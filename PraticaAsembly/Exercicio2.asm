section .data
    msg db 'Quantidade de numeros impares: ', 0
    msg_len equ $ - msg
    result db '0', 10
    result_len equ $ - result

section .bss
    counter resb 1

section .text
    global _start

_start:
    mov rcx, 1      ; Iterador
    mov rbx, 0      ; Contador ímpares

loop_start:
    cmp rcx, 10
    jg loop_end

    mov rax, rcx
    and rax, 1
    cmp rax, 1       ; Verifica se é ímpar
    jne increment

    inc rbx

increment:
    inc rcx
    jmp loop_start

loop_end:
    mov rax, rbx
    add rax, '0'
    mov [result], al

    ; Mensagem
    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, msg_len
    syscall

    ; Resultado
    mov rax, 1
    mov rdi, 1
    mov rsi, result
    mov rdx, result_len
    syscall

    ; Encerrar
    mov rax, 60
    xor rdi, rdi
    syscall
