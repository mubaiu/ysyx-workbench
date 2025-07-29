#include <am.h>
#include <nemu.h>

#define SYNC_ADDR (VGACTL_ADDR + 4)

void __am_gpu_init() {
}

void __am_gpu_config(AM_GPU_CONFIG_T *cfg) {
  uint32_t screen_info = inl(VGACTL_ADDR);
  int w = screen_info >> 16;
  int h = screen_info & 0xffff;
  
  *cfg = (AM_GPU_CONFIG_T) {
    .present = true, 
    .has_accel = false,
    .width = w, 
    .height = h,
    .vmemsz = w * h * sizeof(uint32_t)  // 设置正确的显存大小
  };
}

void __am_gpu_fbdraw(AM_GPU_FBDRAW_T *ctl) {
  int x = ctl->x, y = ctl->y, w = ctl->w, h = ctl->h;
  
  if (w > 0 && h > 0) {
    uint32_t *fb = (uint32_t *)(uintptr_t)FB_ADDR;
    uint32_t *pixels = ctl->pixels;
    uint32_t screen_info = inl(VGACTL_ADDR);
    int screen_w = screen_info >> 16;
    
    // 将像素数据复制到帧缓冲区
    for (int j = 0; j < h; j++) {
      for (int i = 0; i < w; i++) {
        fb[(y + j) * screen_w + (x + i)] = pixels[j * w + i];
      }
    }
  }
  
  // 如果需要同步，向SYNC_ADDR写入1
  if (ctl->sync) {
    outl(SYNC_ADDR, 1);
  }
}

void __am_gpu_status(AM_GPU_STATUS_T *status) {
  status->ready = true;
}
