.section .data
.align 4096 // 4k page size

page_table:
    .quad 0x00100003  // 0x10000 virt -> 0x10000 phys

.section .text
.global _start

_start:
    jmp init_gic
    
    // Set up stack pointer
    mov sp, #0x8000

    // Create page tables
    mov x0, =page_table 	// Grabs address of page_table
    msr TTBRO_EL1, x0 		// Tells MMU location of page_table
    isb  			// Flushes the current instructions
    
    // Enable MMU
    mrs x0, sctlr_el1
    orr x0, x0, #0b1
    orr x0, x0, #(1 << 2)
    orr x0, x0, #(1 << 12)

    msr sctlr_el1, x0
    isb

    jmp run_kernel

run_kernel:
    mov x0, #0x10000 // Kernel address
    br x0
