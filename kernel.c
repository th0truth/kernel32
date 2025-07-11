#define VIDEO_MEMORY (void *)0xb8000

// VGA color modes
#define WHITE_ON_BLACK 0x0f
#define GREEN_ON_BLACK 0x02

// Dimensions for a screen in VGA text mode
#define VGA_MEM_WIDTH 80
#define VGA_MEM_HEIGHT 25

void clear_screen() {
  // Define the video memory variable that points to the address 0xb8000
  char *video_memory = VIDEO_MEMORY;
  unsigned i = 0;
  
  // This loop that clears the screen
  // there are 25 lines each of 80 columns. Each element takes 2 bytes
  while (i < VGA_MEM_WIDTH * VGA_MEM_HEIGHT * 2) {
    video_memory[i] = ' ';
    video_memory[i+1] = WHITE_ON_BLACK;
    i += 2;
  }
}

void putstr(const char *s) {
  // Define the video memory variable that points to the address 0xb8000
  char *video_memory = VIDEO_MEMORY;
  unsigned i = 0, j = 0;

  // This loop writes the string to video memory
  while (s[j] != '\0') {
    video_memory[i] = s[j];
    video_memory[i+1] = WHITE_ON_BLACK;
    i += 2;
    j++;
  }
}

void k_main(void) {
  // Clear the screen
  clear_screen();

  const char *s = "Hello world\n";
  putstr(s);

  for (;;) {
    __asm__("hlt");
  }

  return;
}
