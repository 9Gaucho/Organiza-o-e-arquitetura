############# EXERCÍCIO 1 #############
------------------------------------------------
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
------------------------------------------------
############# EXERCÍCIO 2 #############

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
------------------------------------------------
############# EXERCÍCIO 3 #############

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
------------------------------------------------
############# EXERCÍCIO 4 #############

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
    cmp rcx, 10
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
------------------------------------------------
############# EXERCÍCIO 5 #############


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
------------------------------------
 OBS: Junto ao diretório Organização e arquitetura, possui um arquivo com cada um deles individualmente


