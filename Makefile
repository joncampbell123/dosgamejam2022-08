
TOTOPDIR=.
THISDIR=.

include $(TOTOPDIR)/rules.Makefile

all: bin/donkeys.exe

ZLIBIMIN=zlibimin/obj/zlibimin.lib

$(ZLIBIMIN):
	make -C zlibimin

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

DONKEYS_OBJ=obj/main.obj

obj/main.obj: main.c
	mkdir -p obj
	$(WATCOMENV) $(WCC) $(WCCFLAGS) $(WCCOPT) $(filter %.c,$^)

bin/donkeys.exe: $(DONKEYS_OBJ) $(ZLIBIMIN)
	mkdir -p obj bin
	$(WATCOMENV) $(WLINK) option quiet option map=obj/donkeys.map system dos $(foreach lib,$(filter %.lib,$^),library $(lib)) $(foreach obj,$(filter %.obj,$^),file $(obj)) name bin/donkeys.exe

clean:
	make -C zlibimin clean
	rm -Rf obj bin
