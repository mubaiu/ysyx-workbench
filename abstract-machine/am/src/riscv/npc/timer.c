#include <am.h>
#include <stdint.h>

void __am_timer_init() {
}

void __am_timer_uptime(AM_TIMER_UPTIME_T *uptime) {
  // uptime->us = 0;
  uint32_t hi = *(volatile uint32_t*)(0xa0000000+0x000004c);
  uint32_t lo = *(volatile uint32_t*)(0xa0000000+0x0000048);
  uptime->us = ((uint64_t)hi << 32) | lo;
  
}

void __am_timer_rtc(AM_TIMER_RTC_T *rtc) {
  rtc->second = 0;
  rtc->minute = 0;
  rtc->hour   = 0;
  rtc->day    = 0;
  rtc->month  = 0;
  rtc->year   = 1900;
}
