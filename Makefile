# Copyright 2024 rysndavjd
# Distributed under the terms of the GNU General Public License v2

include config.mk

all:

clean:
	rm -f grub-mksecureboot-${VERSION}.tar.gz

release: clean
	mkdir -p grub-mksecureboot-${VERSION}
	cp -R LICENSE Makefile README.md config.mk \
		grub-mksecureboot.sh grub-mksecureboot-${VERSION}
	tar -cf grub-mksecureboot-${VERSION}.tar grub-mksecureboot-${VERSION}
	gzip grub-mksecureboot-${VERSION}.tar
	rm -rf grub-mksecureboot-${VERSION}

install:
	mkdir -p ${DESTDIR}${PREFIX}/bin
	cp -f grub-mksecureboot.sh ${DESTDIR}${PREFIX}/bin/grub-mksecureboot
	sed -i 's/shversion="git"/shversion='${VERSION}'/' ${DESTDIR}${PREFIX}/bin/grub-mksecureboot
	chmod 755 ${DESTDIR}${PREFIX}/bin/grub-mksecureboot

uninstall:
	rm -fr ${DESTDIR}${PREFIX}/bin/grub-mksecureboot 

.PHONY: all clean release install uninstall
