.global _start

.section _text
    mov x1, #3
    mov x2, #4
    add x3, x1, x2
    mov x0, x3
    ret
