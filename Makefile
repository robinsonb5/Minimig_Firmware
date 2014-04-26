all: romgen amigabootstrap all_m68k all_zpu

all_zpu:
	cd OSD; make DEFS=-D__IEEE_BIG_ENDIAN ARCH=board=phi TARGET=zpu-elf ID=ZPU
	cd OSDBoot_ZPU; make  ARCH=board=phi TARGET=zpu-elf

romgen:
	cd romgen; make

all_m68k:
	cd OSD; make DEFS=-D_M68K ARCH=68000 TARGET=m68k-elf ID=68K
	cd OSDBoot_68K; make ARCH=68000 TARGET=m68k-elf

amigabootstrap:
	cd AmigaBootstrap; make  ARCH=68000 TARGET=m68k-elf

clean: clean_m68k clean_zpu clean_amigabootstrap

clean_m68k:
	cd romgen; make clean
	cd OSD; make clean ARCH=68000 TARGET=m68k-elf
	cd OSDBoot_68K; make clean ARCH=68000 TARGET=m68k-elf

clean_amigabootstrap:
	cd AmigaBootstrap; make clean ARCH=68000 TARGET=m68k-elf

clean_zpu:
	cd OSD; make clean ARCH=board=phi TARGET=zpu-elf

