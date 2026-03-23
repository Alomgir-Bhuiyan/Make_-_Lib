CC ?= gcc
CLANG := clang
LIBFOLDER := ./lib
BUILDDIR := ./build32
LIBHEADER := $(wildcard $(LIBFOLDER)/*.h)
HEADERCFILES := $(patsubst %.h, %.c, $(LIBHEADER))
HEADEROFILES := $(patsubst %.c, %.o, $(HEADERCFILES))
HEADERSOFILES := $(foreach SRC,$(HEADERCFILES),\
    $(LIBFOLDER)/lib$(patsubst lib%,%,$(basename $(notdir $(SRC)))).so)
HEADERDLLFILES := $(foreach SRC,$(HEADERCFILES),\
    $(LIBFOLDER)/lib$(patsubst lib%,%,$(basename $(notdir $(SRC)))).dll)

DLIBNAMES := $(patsubst $(LIBFOLDER)/lib%.so,%,$(HEADERSOFILES))

# Main program
MAINFILES := libl_usage.c
MAINOBJS := $(patsubst %.c, %.o, $(MAINFILES))
BINARY := $(patsubst %.c,%, $(MAINFILES))
ASMDEST32 := ./asm/armf
ASMDEST64 := ./asm/aarch64
S32FILES :=  $(ASMDEST32)/$(patsubst %.c,%.s,$(MAINFILES))
S64FILES := $(ASMDEST64)/$(patsubst %.c,%.s, $(MAINFILES))

OPTFLAGS := -O0

.PHONY: clean run srun

all: obj shared build us asm

obj: $(HEADERCFILES)
	$(CC) -c $(HEADERCFILES) $(OPTFLAGS) -o $(HEADEROFILES)

# Compile shared libraries
shared:
	@for SRC in $(HEADERCFILES); do \
		BASENAME=$$(basename $$SRC .c); \
		NAME=$$(echo $$BASENAME | sed 's/^lib//'); \
		OUT=$(LIBFOLDER)/lib$$NAME.so; \
		$(CC) -fPIC -shared $$SRC -o $$OUT; \
	done
	@for SRC in $(HEADERCFILES); do \
		BASENAME=$$(basename $$SRC .c); \
		NAME=$$(echo $$BASENAME | sed 's/^lib//'); \
		OUT=$(LIBFOLDER)/lib$$NAME.dll; \
		$(CC) -fPIC -shared $$SRC -o $$OUT; \
	done

build: obj shared $(MAINOBJS)
	$(CC) $(MAINOBJS) $(HEADEROFILES) -o $(BUILDDIR)/static/$(BINARY)

us: shared
	$(CC) $(MAINFILES) -L$(LIBFOLDER) $(foreach lib,$(DLIBNAMES),-l$(lib)) -o $(BUILDDIR)/$</$(BINARY)

$(MAINOBJS): $(MAINFILES)
	$(CC) -c $^ -o $@

asm: $(ASMDEST) $(ASMDEST64)
	$(CLANG) --target=armv7-linux-androideabi21 -S $(MAINFILES) -o $(S32FILES)
	$(CLANG) --target=aarch64-linux-android21 -S $(MAINFILES) -o $(S64FILES)

run: build
	$(BUILDDIR)/static/$(BINARY)

srun: us
	LD_LIBRARY_PATH=$(LIBFOLDER) $(BUILDDIR)/shared/$(BINARY)

clean:
	rm -f $(HEADEROFILES) $(HEADERSOFILES) $(HEADERDLLFILES) $(MAINOBJS) $(BUILDDIR)/static/$(BINARY) $(BUILDDIR)/shared/$(BINARY) $(S32FILES) $(S64FILES) 


