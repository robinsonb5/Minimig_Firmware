# *nix Makefile for Minimig bootfirmware assembly
# Written by Christian Vogelgsang <chris@vogelgsang.org>

# ----- the following tools need to be installed -----
# vasm homepage http://sun.hasenbraten.de/vasm
ASM=vasmm68k_mot
ASM_OPTS=
HEXER=python ../hexer.py
ROMGENDIR=../romgen
ROMGEN=$(ROMGENDIR)/romgen

PROJECT=osdload

# ----- rules -----
all: $(PROJECT).hex $(PROJECT).bin $(PROJECT)_ROM.vhd

clean:
	rm -f $(PROJECT).hex $(PROJECT).bin $(PROJECT)_ROM.vhd
	
%.hex: %.bin
	$(HEXER) -l 2048 $< $@

%.bin: %.asm
	$(ASM) $(ASM_OPTS) -Fbin -o $@ $<

%_ROM.vhd: %.bin $(ROMGEN)
	sed 's/soc_firmware/$*_ROM/' >$*_ROM.vhd <$(ROMGENDIR)/rom_prologue.vhd
	$(ROMGEN) $*.bin >>$*_ROM.vhd
	cat >>$*_ROM.vhd $(ROMGENDIR)/rom_epilogue.vhd

$(ROMGEN):
	cd $ROMGENDIR
	make

