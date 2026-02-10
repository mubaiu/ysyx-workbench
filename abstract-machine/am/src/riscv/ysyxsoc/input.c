#include <am.h>
#include <klib.h>
#include <stdint.h>

// PS2 控制器基地址
#define PS2_BASE 0x10011000
#define PS2_DATA (*(volatile uint8_t *)(PS2_BASE + 0x0))

// PS2扫描码定义（使用X-Macro模式）
#define PS2_KEYS(_) \
  _(A, 0x1C) _(B, 0x32) _(C, 0x21) _(D, 0x23) _(E, 0x24) _(F, 0x2B) \
  _(G, 0x34) _(H, 0x33) _(I, 0x43) _(J, 0x3B) _(K, 0x42) _(L, 0x4B) \
  _(M, 0x3A) _(N, 0x31) _(O, 0x44) _(P, 0x4D) _(Q, 0x15) _(R, 0x2D) \
  _(S, 0x1B) _(T, 0x2C) _(U, 0x3C) _(V, 0x2A) _(W, 0x1D) _(X, 0x22) \
  _(Y, 0x35) _(Z, 0x1A) \
  _(1, 0x16) _(2, 0x1E) _(3, 0x26) _(4, 0x25) _(5, 0x2E) \
  _(6, 0x36) _(7, 0x3D) _(8, 0x3E) _(9, 0x46) _(0, 0x45) \
  _(F1, 0x05) _(F2, 0x06) _(F3, 0x04) _(F4, 0x0C) _(F5, 0x03) _(F6, 0x0B) \
  _(F7, 0x83) _(F8, 0x0A) _(F9, 0x01) _(F10, 0x09) _(F11, 0x78) _(F12, 0x07) \
  _(ESCAPE, 0x76) _(GRAVE, 0x0E) _(MINUS, 0x4E) _(EQUALS, 0x55) _(BACKSPACE, 0x66) \
  _(TAB, 0x0D) _(LEFTBRACKET, 0x54) _(RIGHTBRACKET, 0x5B) _(BACKSLASH, 0x5D) \
  _(CAPSLOCK, 0x58) _(SEMICOLON, 0x4C) _(APOSTROPHE, 0x52) _(RETURN, 0x5A) \
  _(LSHIFT, 0x12) _(RSHIFT, 0x59) _(COMMA, 0x41) _(PERIOD, 0x49) _(SLASH, 0x4A) \
  _(LCTRL, 0x14) _(LALT, 0x11) _(SPACE, 0x29)

// 扩展键（0xE0前缀）定义
#define PS2_EXT_KEYS(_) \
  _(UP, 0x75) _(DOWN, 0x72) _(LEFT, 0x6B) _(RIGHT, 0x74) \
  _(INSERT, 0x70) _(DELETE, 0x71) _(HOME, 0x6C) _(END, 0x69) \
  _(PAGEUP, 0x7D) _(PAGEDOWN, 0x7A) _(RCTRL, 0x14) _(RALT, 0x11)

// 生成映射表的宏
#define KEYMAP_ENTRY(key, scancode) [scancode] = AM_KEY_##key,

// 普通键映射表
static const int keymap[256] = {
  PS2_KEYS(KEYMAP_ENTRY)
};

// 扩展键映射表
static const int keymap_ext[256] = {
  PS2_EXT_KEYS(KEYMAP_ENTRY)
};

void __am_input_keybrd(AM_INPUT_KEYBRD_T *kbd) {
  static bool last_was_f0 = false;  // 上一次是否收到0xF0释放码前缀
  static bool last_was_e0 = false;  // 上一次是否收到0xE0扩展键前缀

  uint8_t scancode = PS2_DATA;

  // 无按键信息
  if (scancode == 0) {
    kbd->keydown = 0;
    kbd->keycode = AM_KEY_NONE;
    return;
  }

  // 收到扩展键前缀
  if (scancode == 0xE0) {
    last_was_e0 = true;
    kbd->keydown = 0;
    kbd->keycode = AM_KEY_NONE;
    return;
  }

  // 收到释放码前缀
  if (scancode == 0xF0) {
    last_was_f0 = true;
    kbd->keydown = 0;
    kbd->keycode = AM_KEY_NONE;
    return;
  }

  // 普通扫描码：根据标志判断按下/释放和普通键/扩展键
  kbd->keydown = !last_was_f0;
  if (last_was_e0) {
    kbd->keycode = keymap_ext[scancode];
  } else {
    kbd->keycode = keymap[scancode];
  }

  // 重置标志
  last_was_f0 = false;
  last_was_e0 = false;
}
