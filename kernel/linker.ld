ENTRY(start)

SECTIONS
{
  . = 0x10000;  // Where the kernel will be loaded

  .text : {
    *(.text)  // Include all .text sections from object files
  }

  .data : {
    *(.data)  // Include all .data sections from object files
  }

  .bss : {
    *(.bss)  // Include all .bss sections
  }
}
