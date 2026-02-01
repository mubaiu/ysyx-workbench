#include "trap.h"

#define UART_BASE 0x10000000L
#define UART_TX   0x0
#define MROM_BASE 0x20000000L
#define MROM_SIZE 0x1000  


int main() {
  putch('H');
  putch('e');
  putch('l');
  putch('l'); 
  putch('o');
  putch(',');
  putch('W');
  putch('o');
  putch('r');
  putch('l');
  putch('d');
  putch('!');
  putch('y');
  putch('s');
  putch('y');
  putch('x');
  putch('_');
  putch('\n');
  return 0;
}