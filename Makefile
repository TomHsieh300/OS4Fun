CC = i686-elf-gcc
AS = nasm
LD = i686-elf-ld

kernel.bin: boot.o kernel.o
	$(LD) -T linker.ld -o $@ $^

%.o: %.asm
	$(AS) -f elf32 $< -o $@

%.o: %.c
	$(CC) -c -ffreestanding -o $@ $<

run: kernel.bin
	qemu-system-i386 -kernel kernel.bin

clean:
	rm -f *.o *.bin
