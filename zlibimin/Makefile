
TOTOPDIR=..
THISDIR=.

include $(TOTOPDIR)/rules.Makefile

all: bin obj obj/zlibimin.lib

obj:
	mkdir -p obj

bin:
	mkdir -p bin

# large memory model.
# -zu needed, must not assume DS == SS.
# -d9 debug
# -of traceable stack frames
# -wx warning level max
# -3 386 or higher
WCCFLAGS_DEBUG= -d9 -of
WCCFLAGS_RELEASE= -d0 -os
WCCFLAGS=-e=2 -zu -zq -ml $(WCCFLAGS_DEBUG) -oilrb -bt=dos -wx -3 -dTARGET_MSDOS=16 -dMSDOS=1 -dTARGET86=3 -DMMODE=m -q -i"$(WATCOM)/h"
WCCOPT=-fr=null -fo=$(THISDIR)/obj/.obj

ZLIBIMIN_OBJ=obj/adler32.obj obj/compress.obj obj/crc32.obj obj/inffast.obj obj/inflate.obj obj/inftrees.obj obj/trees.obj obj/uncompr.obj obj/zutil.obj

obj/adler32.obj: obj adler32.c
	$(WATCOMENV) $(WCC) $(WCCFLAGS) $(WCCOPT) $(filter %.c,$^)

obj/compress.obj: obj compress.c
	$(WATCOMENV) $(WCC) $(WCCFLAGS) $(WCCOPT) $(filter %.c,$^)

obj/crc32.obj: obj crc32.c
	$(WATCOMENV) $(WCC) $(WCCFLAGS) $(WCCOPT) $(filter %.c,$^)

obj/inffast.obj: obj inffast.c
	$(WATCOMENV) $(WCC) $(WCCFLAGS) $(WCCOPT) $(filter %.c,$^)

obj/inflate.obj: obj inflate.c
	$(WATCOMENV) $(WCC) $(WCCFLAGS) $(WCCOPT) $(filter %.c,$^)

obj/inftrees.obj: obj inftrees.c
	$(WATCOMENV) $(WCC) $(WCCFLAGS) $(WCCOPT) $(filter %.c,$^)

obj/trees.obj: obj trees.c
	$(WATCOMENV) $(WCC) $(WCCFLAGS) $(WCCOPT) $(filter %.c,$^)

obj/uncompr.obj: obj uncompr.c
	$(WATCOMENV) $(WCC) $(WCCFLAGS) $(WCCOPT) $(filter %.c,$^)

obj/zutil.obj: obj zutil.c
	$(WATCOMENV) $(WCC) $(WCCFLAGS) $(WCCOPT) $(filter %.c,$^)

obj/zlibimin.lib: bin obj $(ZLIBIMIN_OBJ)
	rm -f $@
	wlib -q -b -c $@ $(foreach obj,$(filter %.obj,$^),-+$(obj))

clean:
	rm -Rf obj bin
