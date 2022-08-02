
TOTOPDIR=..
THISDIR=.

include $(TOTOPDIR)/rules.Makefile

all: obj/zlibimin.lib

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

obj/adler32.obj: adler32.c
	mkdir -p obj
	$(WATCOMENV) $(WCC) $(WCCFLAGS) $(WCCOPT) $(filter %.c,$^)

obj/compress.obj: compress.c
	mkdir -p obj
	$(WATCOMENV) $(WCC) $(WCCFLAGS) $(WCCOPT) $(filter %.c,$^)

obj/crc32.obj: crc32.c
	mkdir -p obj
	$(WATCOMENV) $(WCC) $(WCCFLAGS) $(WCCOPT) $(filter %.c,$^)

obj/inffast.obj: inffast.c
	mkdir -p obj
	$(WATCOMENV) $(WCC) $(WCCFLAGS) $(WCCOPT) $(filter %.c,$^)

obj/inflate.obj: inflate.c
	mkdir -p obj
	$(WATCOMENV) $(WCC) $(WCCFLAGS) $(WCCOPT) $(filter %.c,$^)

obj/inftrees.obj: inftrees.c
	mkdir -p obj
	$(WATCOMENV) $(WCC) $(WCCFLAGS) $(WCCOPT) $(filter %.c,$^)

obj/trees.obj: trees.c
	mkdir -p obj
	$(WATCOMENV) $(WCC) $(WCCFLAGS) $(WCCOPT) $(filter %.c,$^)

obj/uncompr.obj: uncompr.c
	mkdir -p obj
	$(WATCOMENV) $(WCC) $(WCCFLAGS) $(WCCOPT) $(filter %.c,$^)

obj/zutil.obj: zutil.c
	mkdir -p obj
	$(WATCOMENV) $(WCC) $(WCCFLAGS) $(WCCOPT) $(filter %.c,$^)

obj/zlibimin.lib: $(ZLIBIMIN_OBJ)
	mkdir -p obj
	rm -f $@
	wlib -q -b -c $@ $(foreach obj,$(filter %.obj,$^),-+$(obj))

clean:
	rm -Rf obj bin
