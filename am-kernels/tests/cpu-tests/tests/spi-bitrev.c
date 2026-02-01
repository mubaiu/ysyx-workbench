#include "trap.h"

// SPI register addresses
#define SPI_BASE    0x10001000
#define SPI_TX      (volatile uint32_t*)(SPI_BASE + 0x00)
#define SPI_RX      (volatile uint32_t*)(SPI_BASE + 0x00)
#define SPI_CTRL    (volatile uint32_t*)(SPI_BASE + 0x10)
#define SPI_DIVIDER (volatile uint32_t*)(SPI_BASE + 0x14)
#define SPI_SS      (volatile uint32_t*)(SPI_BASE + 0x18)

// Control register bits
#define SPI_CTRL_ASS        (1 << 13)
#define SPI_CTRL_IE         (1 << 12)
#define SPI_CTRL_LSB        (1 << 11)
#define SPI_CTRL_TX_NEGEDGE (1 << 10)
#define SPI_CTRL_RX_NEGEDGE (1 << 9)
#define SPI_CTRL_GO         (1 << 8)
#define SPI_CTRL_CHAR_LEN(n) ((n) & 0x7F)

// Slave select for bitrev module
#define BITREV_SLAVE 7

// Function to perform SPI transfer with bitrev module
uint8_t spi_bitrev_transfer(uint8_t data) {
    *SPI_TX = 0x00000000; 
    *SPI_TX = ((uint32_t)data << 8);

    *SPI_DIVIDER = 1;

    *SPI_SS = (1 << BITREV_SLAVE);  // Active low, so invert

    // uint32_t ctrl = SPI_CTRL_CHAR_LEN(15) | SPI_CTRL_GO | (0 << 10) | (0 << 9) | (0 << 11) | (0 << 12) | (0 << 13);
    // uint32_t ctrl = 00000000000000000000000010001111;
    *SPI_CTRL = 0b00000000000000000000000100010000;

    while (*SPI_CTRL & 0b00000000000000000000000100000000) {
    }

    uint32_t rx_data = *SPI_RX;

    *SPI_SS = (0 << BITREV_SLAVE);
    
    return (uint8_t)(rx_data & 0xFF);
}

// Function to reverse bits of a byte
uint8_t reverse_bits(uint8_t data) {
    uint8_t result = 0;
    for (int i = 0; i < 8; i++) {
        result = (result << 1) | (data & 1);
        data >>= 1;
    }
    return result;
}

int main() {
    // uint8_t test_data[] = {
    //     // 0x00,  // 00000000 -> 00000000
    //     // 0xFF,  // 11111111 -> 11111111
    //     // 0x01,  // 00000001 -> 10000000
    //     // 0x80,  // 10000000 -> 00000001
    //     // 0x12,  // 00010010 -> 01001000
    //     // 0x48,  // 01001000 -> 00010010
    //     // 0xA5,  // 10100101 -> 10100101 (palindrome)
    //     // 0x55,  // 01010101 -> 10101010
    //     0xAA,  // 10101010 -> 01010101
    //     // 0x0F,  // 00001111 -> 11110000
    //     // 0xF0,  // 11110000 -> 00001111
    // };

    // int num_tests = sizeof(test_data) / sizeof(test_data[0]);

    // for (int i = 0; i < num_tests; i++) {
    //     uint8_t input = test_data[i];
    //     __attribute_maybe_unused__ uint8_t expected = reverse_bits(input);
    //     __attribute_maybe_unused__ uint8_t result = spi_bitrev_transfer(input);

    //     check(result == expected);
    // }

    return 0;
}
