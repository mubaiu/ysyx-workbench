extern const unsigned char rom_100in1_nes[];
extern unsigned int rom_100in1_nes_len;
extern const unsigned char rom_mario_nes[];
extern unsigned int rom_mario_nes_len;

struct rom {
  const char *name;
  const void *body;
  unsigned int *size;
};

struct rom roms[] = {
  { .name = "100in1", .body = rom_100in1_nes, .size = &rom_100in1_nes_len, },
  { .name = "mario", .body = rom_mario_nes, .size = &rom_mario_nes_len, },
};
int nroms = 2;
