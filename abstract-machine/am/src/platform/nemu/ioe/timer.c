#include <am.h>
#include <nemu.h>

void __am_timer_init() {
}

void __am_timer_uptime(AM_TIMER_UPTIME_T *uptime) {
  // uint32_t lo, hi;
  
  // 然后读取高32位
  uint32_t hi = inl(RTC_ADDR + 4);
  // 首先读取低32位
  uint32_t lo = inl(RTC_ADDR);
  
  
  // 组合成一个64位的微秒计数值
  uptime->us = ((uint64_t)hi << 32) | lo;
}

void __am_timer_rtc(AM_TIMER_RTC_T *rtc) {
  // 获取系统运行时间（微秒）
  AM_TIMER_UPTIME_T uptime = {};
  __am_timer_uptime(&uptime);
  
  // 将微秒转换为秒
  uint64_t total_seconds = uptime.us / 1000000;
  
  // 设置一个基准时间（例如：2023年1月1日00:00:00）
  uint32_t base_year = 2023;
  
  // 计算当前时间
  // 每分钟60秒，每小时60分钟，每天24小时
  rtc->second = total_seconds % 60;
  rtc->minute = (total_seconds / 60) % 60;
  rtc->hour   = (total_seconds / 3600) % 24;
  
  // 简化的日期计算（不考虑闰年和月份天数差异）
  uint64_t days = total_seconds / (24 * 3600);
  
  // 假设平均每月30天
  rtc->day   = (days % 30) + 1;  // 日期从1开始
  rtc->month = ((days / 30) % 12) + 1;  // 月份从1开始
  rtc->year  = base_year + (days / 365);  // 简化年份计算
}
