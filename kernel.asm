bits 32

; multiboot spec
section .multiboot_header
align 4
header_start:
  dd 0x1BADB002             ; magic
  dd 0x00                   ; flags
  dd - (0x1BADB002 + 0x00)   ; checksum. m + f + c should be zero 

section .text
global start
extern k_main           ; k_main is our kernel function defined in C file

start:
  cli                  ; block interrupts
  mov esp, stack_space ; set stack pointer
  call k_main
  hlt                  ; halt the CPU

section .bss
resb 8192              ; 8KB for stack 
stack_space: 