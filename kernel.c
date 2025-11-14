void kernel_main() {
    const char* msg = "Hello from my OS kernel!  ";
    char* vga = (char*)0xB8000;
    
    for (int i = 0; msg[i]; i++) {
        vga[i * 2]     = msg[i];
        vga[i * 2 + 1] = 0x07;
    }
}
