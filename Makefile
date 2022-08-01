
TOTOPDIR=.

include rules.Makefile

all: bin obj bin/donkeys.exe

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
WCCOPT=-fr=null -fo=$(TOTOPDIR)/obj/.obj

DONKEYS_OBJ=obj/main.obj

obj/main.obj: obj main.c
	$(WATCOMENV) $(WCC) $(WCCFLAGS) $(WCCOPT) $(filter %.c,$^)

bin/donkeys.exe: bin obj $(DONKEYS_OBJ)
	$(WATCOMENV) $(WLINK) option quiet option map=obj/donkeys.map system dos $(foreach obj,$(DONKEYS_OBJ),file $(obj)) name bin/donkeys.exe

clean:
	rm -Rf obj bin
