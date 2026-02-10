#include <am.h>
#include <klib-macros.h>

// VGA 帧缓冲定义
#define FB_ADDR 0x21000000
#define SCREEN_W 640
#define SCREEN_H 480

// GPU配置函数
void __am_gpu_config(AM_GPU_CONFIG_T *cfg) {
  cfg->present = true;
  cfg->has_accel = false;
  cfg->width = SCREEN_W;
  cfg->height = SCREEN_H;
  cfg->vmemsz = SCREEN_W * SCREEN_H * sizeof(uint32_t);
}

// GPU帧缓冲绘制函数
void __am_gpu_fbdraw(AM_GPU_FBDRAW_T *ctl) {
  uint32_t *fb = (uint32_t *)FB_ADDR;
  uint32_t *pixels = (uint32_t *)ctl->pixels;

  int x = ctl->x, y = ctl->y, w = ctl->w, h = ctl->h;

  // 将像素数据拷贝到帧缓冲
  for (int j = 0; j < h; j++) {
    for (int i = 0; i < w; i++) {
      int fb_idx = (y + j) * SCREEN_W + (x + i);
      int pixel_idx = j * w + i;
      fb[fb_idx] = pixels[pixel_idx];
    }
  }
}

// GPU状态函数
void __am_gpu_status(AM_GPU_STATUS_T *status) {
  status->ready = true;  // NVBoard自动刷新，总是准备好
}