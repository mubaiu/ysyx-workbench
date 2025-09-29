#include <am.h>
#include <stdint.h>
#include <stdio.h> 
#include <time.h>

#define CYCLE_PER_US 5  // 假设主频为50MHz

static inline uint64_t read_mcycle() {
  uint32_t hi, lo;
  asm volatile ("csrr %0, mcycleh" : "=r"(hi));
  asm volatile ("csrr %0, mcycle"  : "=r"(lo));
  return ((uint64_t)hi << 32) | lo;
}

void __am_timer_init() {
}

void __am_timer_uptime(AM_TIMER_UPTIME_T *uptime) {
  uint32_t hi, lo;
  asm volatile ("csrr %0, mcycleh" : "=r"(hi));
  asm volatile ("csrr %0, mcycle"  : "=r"(lo));
  uptime->us = ((((uint64_t)hi << 32) | lo) / CYCLE_PER_US);
}

void __am_timer_rtc(AM_TIMER_RTC_T *rtc) {
  rtc->second = 0;
  rtc->minute = 0;
  rtc->hour   = 0;
  rtc->day    = 0;
  rtc->month  = 0;
  rtc->year   = 1900;
}
