#include <am.h>
#include <klib.h>
#include <time.h>

// 定义设备地址
#define DEVICE_BASE 0xa0000000
#define RTC_ADDR    (DEVICE_BASE + 0x0000048)

// 从RTC设备读取64位时间戳
static uint64_t get_time() {
  uint32_t lo = *(volatile uint32_t *)(RTC_ADDR);
  uint32_t hi = *(volatile uint32_t *)(RTC_ADDR + 4);
  return ((uint64_t)hi << 32) | lo;
}

void __am_timer_init() {
  // 初始化不需要做任何事情，设备已经通过paddr.c中的实现准备好了
}

void __am_timer_uptime(AM_TIMER_UPTIME_T *uptime) {
  // 从RTC获取微秒级时间戳
  uptime->us = get_time() * 1000000; // 转换为微秒
}

void __am_timer_rtc(AM_TIMER_RTC_T *rtc) {
  // 使用简单算法将时间戳转换为日期和时间
  // 避免使用localtime函数
  uint64_t t = get_time();
  
  // 基础计算常量
  // const uint32_t SECONDS_PER_DAY = 86400;
  // const uint32_t SECONDS_PER_HOUR = 3600;
  const uint32_t SECONDS_PER_MINUTE = 60;
  
  // 每个月的天数，非闰年
  static const int days_in_month[] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
  
  // 从1970年1月1日开始计算
  int year = 1970;
  int month = 1;
  
  // 计算秒、分、时
  rtc->second = t % SECONDS_PER_MINUTE;
  t /= SECONDS_PER_MINUTE;
  rtc->minute = t % SECONDS_PER_MINUTE;
  t /= SECONDS_PER_MINUTE;
  rtc->hour = t % 24;
  t /= 24; // t现在表示从1970年1月1日开始的天数
  
  // 计算年份
  while (1) {
    int days_in_year = 365;
    if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)) {
      days_in_year = 366; // 闰年
    }
    
    if (t < days_in_year) {
      break;
    }
    
    t -= days_in_year;
    year++;
  }
  
  // 计算月份和日期
  for (month = 0; month < 12; month++) {
    int days = days_in_month[month];
    
    // 处理闰年2月
    if (month == 1 && ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0))) {
      days = 29;
    }
    
    if (t < days) {
      break;
    }
    
    t -= days;
  }
  
  rtc->day = t + 1;      // 日从1开始
  rtc->month = month + 1; // 月从1开始
  rtc->year = year;       // 年份已经是公历年份
}