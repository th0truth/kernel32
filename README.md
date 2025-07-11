The minimal 32-bit kernel from scratch.


# **Installation**

Clone git repo to the directory.

```bash
git clone https://github.com/th0truth/kernel32.git
cd kernel32
```

## **How to use**

```bash
nasm -f elf32 -o kasm.o kernel.asm
gcc -m32 -ffreestanding -nostdlib -c kernel.c -o kc.o
ld -m elf_i386 -T link.ld -no-pie -o kernel kasm.o kc.o

qemu-system-i386 -kernel kernel
```


