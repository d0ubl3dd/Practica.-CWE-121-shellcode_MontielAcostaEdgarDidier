section .data                   
    ; segmento DATA 
    mensaje db "Hola mundo", 0x0a  ; mensaje con salto de línea

section .text                   
    ; segmento TEXT 
    global _start                ; punto de entrada del ELF 

_start:
    ; syscall write(1, mensaje, 11)
    mov eax, 4                   ; syscall número 4: sys_write
    mov ebx, 1                   ; file descriptor 1: STDOUT
    mov ecx, mensaje             ; dirección del mensaje
    mov edx, 11                  ; longitud del mensaje (incluyendo \n)
    int 0x80                     ; llamada al sistema

    ; syscall exit(0)
    mov eax, 1                   ; syscall número 1: sys_exit
    mov ebx, 0                   ; código de salida 0
    int 0x80                     ; llamada al sistema