#include "trap.h"

#define FLASH_BASE 0x30000000

// Helper function to print hex digit
void print_hex_digit(uint8_t digit) {
    if (digit < 10) {
        putch('0' + digit);
    } else {
        putch('a' + (digit - 10));
    }
}

// Helper function to print 32-bit hex value
void print_hex(uint32_t val) {
    putch('0');
    putch('x');
    for (int i = 7; i >= 0; i--) {
        uint8_t digit = (val >> (i * 4)) & 0xF;
        print_hex_digit(digit);
    }
}

int main() {
    putch('X');
    putch('I');
    putch('P');
    putch(' ');
    putch('T');
    putch('e');
    putch('s');
    putch('t');
    putch('\n');

    // Read from flash using XIP mode (direct pointer access)
    volatile uint32_t *flash_ptr = (volatile uint32_t *)FLASH_BASE;

    putch('R');
    putch('e');
    putch('a');
    putch('d');
    putch('[');
    putch('0');
    putch(']');
    putch('=');

    uint32_t data0 = flash_ptr[0];
    print_hex(data0);
    putch('\n');

    putch('R');
    putch('e');
    putch('a');
    putch('d');
    putch('[');
    putch('1');
    putch(']');
    putch('=');

    uint32_t data1 = flash_ptr[1];
    print_hex(data1);
    putch('\n');

    putch('R');
    putch('e');
    putch('a');
    putch('d');
    putch('[');
    putch('2');
    putch(']');
    putch('=');

    uint32_t data2 = flash_ptr[2];
    print_hex(data2);
    putch('\n');

    putch('R');
    putch('e');
    putch('a');
    putch('d');
    putch('[');
    putch('3');
    putch(']');
    putch('=');

    uint32_t data3 = flash_ptr[3];
    print_hex(data3);
    putch('\n');

    // Test flash write (should trigger error)
    putch('W');
    putch('r');
    putch('i');
    putch('t');
    putch('e');
    putch(' ');
    putch('T');
    putch('e');
    putch('s');
    putch('t');
    putch(':');
    putch('\n');

    // Attempt to write to flash (should fail with error)
    // flash_ptr[0] = 0xDEADBEEF;

    // If we reach here, write didn't trigger error (unexpected)
    // putch('W');
    // putch('r');
    // putch('i');
    // putch('t');
    // putch('e');
    // putch(' ');
    // putch('O');
    // putch('K');
    // putch('?');
    // putch('\n');

    putch('D');
    putch('o');
    putch('n');
    putch('e');
    putch('!');
    putch('\n');

    return 0;
}
