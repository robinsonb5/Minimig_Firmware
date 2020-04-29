#ifndef UART_H
#define UART_H

/* Hardware registers for a supporting UART to the ZPUFlex project. */

#define UARTBASE 0xda8000
#define HW_UART(x) *(volatile unsigned char *)(UARTBASE+x)

#define REG_UART 0x0
#define REG_UART_RXINT 9
#define REG_UART_TXREADY 8

int putchar(int c);
int puts(const char *msg);

#endif

