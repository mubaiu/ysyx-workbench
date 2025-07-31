#include <am.h>

// 移除 #include <sys/time.h> 和 #include <time.h>

// 使用简单的计数器代替系统时间
static uint64_t boot_us = 0;
static uint64_t current_us = 0;

// 模拟RTC的起始时间 (例如：2023年1月1日 00:00:00)
static int rtc_base_year = 2023;
static int rtc_base_month = 1;
static int rtc_base_day = 1;
static int rtc_base_hour = 0;
static int rtc_base_minute = 0;
static int rtc_base_second = 0;

// 读取RISC-V的计数器寄存器获取时间
static uint64_t get_time() {
  // 在实际实现中，这里应该读取RISC-V的计时器寄存器
  // 例如读取 mtime 寄存器或其他硬件计时器
  // 简化实现：每次调用增加一定的微秒数
  current_us += 1000; // 模拟时间流逝，每次+1ms
  return current_us;
}

void __am_timer_init() {
  boot_us = get_time();
}

void __am_timer_uptime(AM_TIMER_UPTIME_T *uptime) {
  uptime->us = get_time() - boot_us;
}

void __am_timer_rtc(AM_TIMER_RTC_T *rtc) {
  // 简化实现：返回固定的日期时间
  // 真实实现应该基于uptime计算当前日期和时间
  rtc->second = rtc_base_second;
  rtc->minute = rtc_base_minute;
  rtc->hour   = rtc_base_hour;
  rtc->day    = rtc_base_day;
  rtc->month  = rtc_base_month;
  rtc->year   = rtc_base_year;
}