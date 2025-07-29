#include <am.h>
#include <nemu.h>
#include <stdio.h>

void __am_timer_init() {
}

void __am_timer_uptime(AM_TIMER_UPTIME_T *uptime) {
  // // uint32_t lo, hi;
  
  // // 然后读取高32位
  // uint32_t hi = inl(RTC_ADDR + 4);
  // // 首先读取低32位
  // uint32_t lo = inl(RTC_ADDR);
  
  
  // // 组合成一个64位的微秒计数值
  // uptime->us = ((uint64_t)hi << 32) | lo;
  printf("未初始化的uptime->us值: %lu\n", uptime->us);
}

void __am_timer_rtc(AM_TIMER_RTC_T *rtc) {
  rtc->second = 0;
  rtc->minute = 0;
  rtc->hour   = 0;
  rtc->day    = 0;
  rtc->month  = 0;
  rtc->year   = 1900;
}
