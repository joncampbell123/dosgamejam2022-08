
WATCOM=/usr/src/open-watcom-v2/rel

WCC=$(WATCOM)/binl/wcc
WLINK=$(WATCOM)/binl/wlink

WATCOMENV=WATCOM=$(WATCOM) PATH=$(WATCOM)/binl:$(WATCOM)/binw:$(PATH) EDPATH=$(WATCOM)/eddat INCLUDE=$(WATCOM)/lh
