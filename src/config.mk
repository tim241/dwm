# dwm version
VERSION = 6.1

# Customize below to fit your system

# paths
PREFIX = /usr/local

X11INC = `pkg-config --cflags x11`
X11LIB = `pkg-config --cflags x11 --libs`

# Xinerama, comment if you don't want it
XINERAMAFLAGS = -DXINERAMA

# includes and libs
INCS = `pkg-config --cflags freetype2 xinerama xft` -Iinclude ${X11INC}
LIBS = `pkg-config --cflags freetype2 xinerama xft fontconfig --libs` ${X11LIB}

# flags
CPPFLAGS = -DVERSION=\"${VERSION}\" ${XINERAMAFLAGS}
CFLAGS   = -std=c99 -pedantic -Wall -Wno-deprecated-declarations -Os ${INCS} ${CPPFLAGS}

LDFLAGS  = ${LIBS}

# compiler and linker
CC = cc
