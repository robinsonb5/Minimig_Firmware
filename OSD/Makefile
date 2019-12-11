# Supply these as parameters from higher up.
TARGET=m68k-elf
ARCH=68000
DEFS=
ID=_CA

C_SRC=fat.c fdd.c fpga.c hardware.c  hdd.c main.c menu.c mmc.c osd.c printf.c swap.c config.c rafile.c hexdump.c # small_printf.c
KLIBC_SRC=vsnprintf.c sprintf.c memcpy.c memcmp.c strcpy.c strcat.c strncat.c strncmp.c strlen.c memset.c strncpy.c strchr.c
A_SRC=startup_$(TARGET).s

BUILD_DIR=$(TARGET)-build
C_OBJ=$(patsubst %.c,$(BUILD_DIR)/%.o,$(C_SRC))
LIBC_OBJ=$(patsubst %.c,$(BUILD_DIR)/%.o,$(KLIBC_SRC))
A_OBJ=$(patsubst %.s,$(BUILD_DIR)/%.o,$(A_SRC))
OBJ=$(C_OBJ) $(A_OBJ)

CC=$(TARGET)-gcc
AR=$(TARGET)-ar
OBJCOPY=$(TARGET)-objcopy
CFLAGS+=$(DEFS) -m$(ARCH) -Wall -Wno-char-subscripts -Os -fno-common -fomit-frame-pointer -I./include -DACTIONREPLAY_BROKEN
LDFLAGS+=-m$(ARCH) -Xlinker -Map=menu.map -nostartfiles -nostdlib -lgcc -L$(BUILD_DIR)

ELF=$(BUILD_DIR)/menu.elf
OUTPUT=OSD$(ID)01.sys
LINK_SCRIPT=osd_$(TARGET).ld
LIBC_TARGET=$(BUILD_DIR)/libc.a

all: $(BUILD_DIR) $(LIBC_TARGET) $(OUTPUT)

clean:
	rm -rf $(BUILD_DIR) $(LIBC_TARGET) $(ELF) $(OUTPUT)

$(LIBC_TARGET): $(LIBC_OBJ)
	$(AR) -r $(LIBC_TARGET) $(LIBC_OBJ)

$(OUTPUT): $(ELF)
	$(OBJCOPY) -O binary $(ELF) $(OUTPUT)

$(ELF): $(OBJ) $(LINK_SCRIPT)
	$(CC) -o $@ -T $(LINK_SCRIPT) $(OBJ) $(LIBC_OBJ) $(LDFLAGS) 

$(BUILD_DIR):
	mkdir $(BUILD_DIR)
	
$(BUILD_DIR)/%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

$(BUILD_DIR)/%.o: klibc/%.c
	$(CC) $(CFLAGS) -c -o $@ $<

$(BUILD_DIR)/%.o: %.s
	$(CC) $(CFLAGS) -c -o $@ $<

