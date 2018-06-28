# dwm - dynamic window manager
# See LICENSE file for copyright and license details.

include src/config.mk

SRC = src/drw.c src/dwm.c src/util.c
OBJ = ${SRC:.c=.o}

all: dwm

.o:
	${CC} -c ${CFLAGS} -o$(<:.c:.o)

${OBJ}: include/config.h src/config.mk

include/config.h:
	cp include/config.def.h include/config.h

dwm: ${OBJ}
	${CC} -o $@ ${OBJ} ${LDFLAGS}

clean:
	rm -f dwm include/config.h ${OBJ} dwm-${VERSION}.tar.gz

dist: clean
	mkdir -p dwm-${VERSION}
	cp -R Makefile include/ config.mk \
		${SRC} dwm-${VERSION}
	tar -cf dwm-${VERSION}.tar dwm-${VERSION}
	gzip dwm-${VERSION}.tar
	rm -rf dwm-${VERSION}

install: all
	install dwm -m 755 ${DESTDIR}${PREFIX}/bin

uninstall:
	rm -f ${DESTDIR}${PREFIX}/bin/dwm

.PHONY: all clean dist install uninstall
