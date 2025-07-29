#include <am.h>
#include <nemu.h>

#define KEYDOWN_MASK 0x8000
#define CONFIG_I8042_DATA_MMIO 0xa0000060

void __am_input_keybrd(AM_INPUT_KEYBRD_T *kbd) {
  uint32_t key_data = inl(CONFIG_I8042_DATA_MMIO);  // 从I/O端口读取键盘数据
  
  // 解析键盘数据
  // KEYDOWN_MASK (0x8000) 用于判断按键状态
  kbd->keydown = (key_data & KEYDOWN_MASK) ? 1 : 0;
  kbd->keycode = key_data & ~KEYDOWN_MASK;  // 移除状态位，获取纯键盘码
}