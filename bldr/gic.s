.global init_gic 

init_gic:
    // Enable distributor    
    ldr x0, =0x1e000000 // GICCPU
    mov w1, #1 
    str w1, [x0, #0x000]

    mov w1, #0xFF // Set min priority
    str w1, [x0, #0x004]


    ldr x0, =0x1e001000 // GICDIST
    mov w1, #1
    str w1, [x0, #0x000]


    // EXAMPLE: Enable interrupt 1
    
    // Set priority in distributor
    ldr x0, =0x1e001000 // GICDIST
    // Assigning priority 0xA0
    mov w1, #0xA0 // Most GIC registers are only one word long.
    str w1, [x0, #0x400 + (13 * 4)]

    // Enable interrupt in distributor
    mov w1, #1 << 13
    str w1, [x0, #0x100]

    // Route IRQ 13 to CPU 0
    mov w1, #1
    str w1, [x0, #0x800 + (13 / 4)]
    
    // Enable interrupts in the CPU
    msr daifclr, #2
