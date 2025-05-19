section .data
mensagem db 72, 101, 108, 108, 111, 10 ; mensagem Hello em ASCII com

,quebra de linha

section .text
global _start

_start:
mov rax, 1 ; identificador da chamada sys_write
mov rdi, 1 ; saída padrão
mov rsi, mensagem ; apontamos para o endereço da mensagem que

, queremos imprimir

mov rdx, 6 ; tamanho da mensagem
syscall

mov rax, 60 ; identificador da chamada sys_exit
mov rdi, 0
syscall
