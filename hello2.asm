section .data
mensagem db 'Hello , World!', 10

section .text
global _start

_start:
mov rax, 1 ;identificador da chamada sys_write
mov rdi, 1 ;saida padrao
mov rsi, mensagem ; apontamos para o endereço da mensagem que

,queremos imprimir

mov rdx, 14 ; tamanho da mensagem
syscall

mov rax, 60 ; identificador da chamada sys_exit
mov rdi, 0
syscall
