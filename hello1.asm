mkdir projeto_assembly
section .data
mensagem db 'Hello , World!'
section .text
global _start

_start:
mov rax, 1 ; identificador da chamada sys_write
mov rdi, 1 ; saida padrao
mov rsi, mensagem ; apontamos para o endereço da mensagem que

, queremos imprimir

mov rdx, 13 ; tamanho da mensagem
syscall

mov rax, 60 ; identificador da chamada sys_exit
mov rdi, 0
syscall
