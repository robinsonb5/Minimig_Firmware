all: all_m68k

all_m68k:
	cd OSD; make ARCH=68000 TARGET=m68k-elf
	cd OSDBoot_68K; make  ARCH=68000 TARGET=m68k-elf
	cd AmigaBootstrap; make  ARCH=6800 TARGET=m68k-elf

clean: clean_m68k

clean_m68k:
	cd OSD; make clean ARCH=68000 TARGET=m68k-elf
	cd OSDBoot_68K; make clean ARCH=68000 TARGET=m68k-elf
	cd AmigaBootstrap; make clean ARCH=68000 TARGET=m68k-elf

