SECTIONS
{
	. = 0x2000;
	.code : {
	  m68k-elf-build/startup_m68k-elf.o (.text)
	  *(.text)
	  *(.rodata)
	  *(.rodata.*)
	  *(.data)
	}
	.extra : {
		__s_bss = . ;
	  *(.bss)
	  	__e_bss = . ;
	}
	.eh_frame : {
	  *(.eh_frame)
	}
	heap_low = .; /* for _sbrk */
	. = . + 0x1000; /* 64kB of heap memory */
	heap_top = .; /* for _sbrk */

	stack_top = 0x7fffc; /* for startup.s */
}
