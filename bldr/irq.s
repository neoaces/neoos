.global irq_handler

irq_handler:
    // Reads the interrupt from GICCPU
    ldr x0, #0x1e000000
    ldr w1, [x0, #0x0C] // GICC_IAR
    
    cmp w1, #13 // Interrupt 13: TEST
    beq handle_irq_13
    
    b oob_irq

handle_irq_13:
    // Handle logic here
    b end_irq

end_irq:
    str w1, [x0, #0x010]
    eret
