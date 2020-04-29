#include "uart.h"

int putchar(int c)
{
//	while(!(HW_UART(REG_UART)&(1<<REG_UART_TXREADY)))
//		;
	HW_UART(REG_UART)=c;
	return(c);
}


int puts(const unsigned char *msg)
{
	int c;
	int result=0;
	while(c=*msg++)
	{
		putchar(c);
		++result;
	}
	return(result);
}

