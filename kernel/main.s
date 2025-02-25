.global _start

.section .text

_start:
    ldr x1, =3
    ldr x2, =4
    add x3, x1, x2
    mov x0, x3
    mov x8, #93
    svc 0 
