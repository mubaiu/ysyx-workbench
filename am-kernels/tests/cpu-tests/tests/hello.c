#include <stdio.h>

int main() {
    char buffer[50]; // 定义一个缓冲区，大小为 50 字节
    int number = 42;
    const char *name = "Alice";
    float pi = 3.14159;

    // 使用 snprintf 格式化字符串
    snprintf(buffer, sizeof(buffer), "Hello, %s! Number: %d, Pi: %.2f", name, number, pi);
    printf("%s/n", buffer);
    return 0;
}