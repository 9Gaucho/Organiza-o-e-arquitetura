; mudanca de requisitos
; aplicacao deve printar na tela 'qual seu nome?'
; utilizador informa nome
; aplicacao deve imprimir na tela 'Ola $nome'


section .data
        mensagem db 'Informe seu nome' , 10
        tamanhoPergunta equ $-pergunta

        tamNome equ 10

section .bss
        nome resb tamNome

section .text
        global _start

_start:
        ; imprimindo mesnagem 'Informe seu nome'
        mov rax, 1     ; identificador de sys_write(exibe algo em tela)
        mov rdi, 1      ; 1 = saída padrão
        mov rsi, pergunta       ; apontamos para o endereço de msg
        mov rdx, tamanhoPergunta        ; tamanho da mensagem
        syscall

        ;ler o nome da pessoa

        mov rax, 0      ; identificador de sys_read (le algo na tela)
        mov rdi, 0      ; entrada padrão
        mov rsi, nome
        mov rdx, tamNome
        syscall

        mov rax; 60     ; identificador da syscall sys_exit
        mov rdi; 0      ; tudo certo
        syscall

