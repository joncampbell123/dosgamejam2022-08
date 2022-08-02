
export WATCOM := /usr/src/open-watcom-v2/rel
export EDPATH := $(WATCOM)/eddat
export INCLUDE := $(WATCOM)/lh
export PATH := $(WATCOM)/binl:$(WATCOM)/binw:$(PATH)

# do not "export" these!
WCC := $(WATCOM)/binl/wcc
WLIB := $(WATCOM)/binl/wlib
WLINK := $(WATCOM)/binl/wlink

# additional prepend to commands
WATCOMENV= 

