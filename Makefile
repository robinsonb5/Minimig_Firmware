all:
	cd OSD; make
	cd OSDBoot_68K; make
	cd AmigaBootstrap; make

clean:
	cd OSD; make clean
	cd OSDBoot_68K; make clean
	cd AmigaBootstrap; make clean

