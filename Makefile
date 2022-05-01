#/*********************
#* Motorola MC6839
#* Floating-Point ROM for the MC6809
#* © 1982 Motorola
#*
#* Makefile by tim lindner
#* <tlindner@macmess.org>
#*
#* December 2020
#*
#* This is in the public domain
#*
#**********************/

ASM = lwasm
ASOUT = -fobj -o
INSTALLDIR = /usr/local/share/cmoc

LIBRARY = fp09_rom.o fp09_FADD.o fp09_BINDEC.o fp09_DECBIN.o fp09_FAB.o fp09_FCMP.o \
	fp09_FTCMP.o fp09_FPCMP.o fp09_FDIV.o fp09_FFIXS.o fp09_FFIXD.o fp09_FFLTS.o \
	fp09_FFLTD.o fp09_FINT.o fp09_FMOV.o fp09_FMUL.o fp09_FNEG.o fp09_FREM.o \
	fp09_FSUB.o fp09_FSQRT.o

%.o: %.asm
	$(ASM) $(AFLAGS) $< $(ASOUT)$@

libfp09.a: $(LIBRARY)
	lwar -c $@ $(LIBRARY)

all: libfp09.a

install: libfp09.a
	install -d $(INSTALLDIR)/lib
	install -d $(INSTALLDIR)/include
	install -m 644 libfp09.a $(INSTALLDIR)/lib
	install -m 644 fp09.h $(INSTALLDIR)/include

clean:
	rm *.o libfp09.a
