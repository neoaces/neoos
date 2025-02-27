.section .text
.global _start

_start:
    ldr x0, =0x40010000 // Base RAM address
    mov x1, #3
    str x1, [x0]
    nop
