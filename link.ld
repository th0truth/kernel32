OUTPUT_FORMAT(elf32-i386)
ENTRY(start)
SECTIONS
{
  . = 0x100000;           /*Kernel loads address (1MB)*/
  .text ALIGN(4096): {
    *(.multiboot_header)
    *(.text)
  } :text
  
  /*Read-write sections (non-executable)*/
  .rodata ALIGN(4096) : { *(.rodata*) }
  .data : ALIGN(4096) {
    *(.data)
  }
  
  .bss  : {
    _sbss = .;
    *(COMMON)
    *(.bss)
    _ebss = .;
  }

  /*Discard unnecessary sections*/
  /DISCARD/ : { *(.comment .note .eh_frame) }
}

/*Define segment permissions*/
PHDRS {
  text PT_LOAD FLAGS(5); /*Read + Execute*/
  data PT_LOAD FLAGS(6); /*Read + Write*/
}