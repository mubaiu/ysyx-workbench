#include <stdint.h>
#include <stdio.h>

// 学号存储在marchid CSR中（地址0xF12）
#define CSR_MARCHID 0xF12

// 读取marchid CSR寄存器
static inline uint32_t read_csr_marchid() {
    uint32_t value;
    asm volatile("csrr %0, %1" : "=r"(value) : "i"(CSR_MARCHID));
    return value;
}

// GPIO 基地址
#define GPIO_BASE 0x10002000

// GPIO 寄存器偏移
#define GPIO_LED_OFFSET  0x0
#define GPIO_SW_OFFSET   0x4
#define GPIO_SEG_OFFSET  0x8

// GPIO 寄存器地址
#define GPIO_LED  (*(volatile uint32_t *)(GPIO_BASE + GPIO_LED_OFFSET))
#define GPIO_SW   (*(volatile uint32_t *)(GPIO_BASE + GPIO_SW_OFFSET))
#define GPIO_SEG  (*(volatile uint32_t *)(GPIO_BASE + GPIO_SEG_OFFSET))

// 简单延时函数
void delay(int count) {
    for (volatile int i = 0; i < count; i++) {
        for (volatile int j = 0; j < 1000; j++);
    }
}

int main() {
    // 从marchid CSR读取学号并显示在7段数码管上
    // 学号的32位会被分解为8个十六进制数字（每个数码管显示一个）
    uint32_t student_id = read_csr_marchid();
    GPIO_SEG = student_id;

    // 定义16位密码（例如：0x1234 表示拨码开关需要设置为 0001 0010 0011 0100）
    uint16_t password = 0x1234;
    uint16_t switch_state;

    // 密码验证阶段：LED显示等待状态（全灭）
    GPIO_LED = 0x0000;

    // 不断查询拨码开关状态，直到与密码匹配
    while (1) {
        // 读取拨码开关状态（低16位）
        switch_state = GPIO_SW & 0xFFFF;

        // 检查是否与密码一致
        if (switch_state == password) {
            // 密码正确，LED全亮表示验证通过
            GPIO_LED = 0xFFFF;
            delay(50);  // 显示一段时间
            break;  // 跳出密码验证循环
        }

        // 短暂延时，避免过于频繁读取
        delay(1);
    }

    // 密码验证通过后，开始LED流水灯效果
    uint16_t led_pattern = 0x0001;  // 初始点亮第一个 LED

    while (1) {
        // 写入 LED 寄存器
        GPIO_LED = led_pattern;

        // 延时
        delay(10);

        // 左移一位，实现流水灯效果
        led_pattern = led_pattern << 1;

        // 如果移出范围，重新从第一个开始
        if (led_pattern == 0 || led_pattern > 0x8000) {
            led_pattern = 0x0001;
        }
    }

    return 0;
}
