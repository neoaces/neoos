.DELETE_ON_ERROR:
.RECIPEPREFIX = >

# CONSTANTS
AS = as
ASFLAGS = -g
ASMEXT = s
CEXT = c
LINKER = ld
LDFLAGS += -static -nostdlib
SHELL := /bin/zsh

BLDRNAME = bootloader
KERNELNAME = kernel

BLDRBUILD = build/bldr
KERNELBUILD = build/kernel
BLDRDIR = bldr
KERNELDIR = kernel

# VARIABLES
BLDRSRCS := $(wildcard $(BLDRDIR)/*.$(ASMEXT))
$(info BLDRSRCS = $(BLDRSRCS))
 
BLDROBJS := $(patsubst $(BLDRDIR)/%.$(ASMEXT),$(BLDRBUILD)/%.o,$(BLDRSRCS))
$(info BLDROBJS = $(BLDROBJS))

KERNELSRCS := $(wildcard $(KERNELDIR)/*.$(CEXT))
$(info KERNELSRCS = $(KERNELSRCS))
 
KERNELOBJS := $(patsubst $(KERNELDIR)/%.$(ASMEXT),$(BUILDDIR)/%.o,$(KERNELSRCS))
$(info KERNELOBJS = $(KERNELOBJS))

# RULES
# Generates all executables
all: 	$(BLDRNAME) $(KERNELNAME)

# BOOTLOADER =======
# Links the executable
$(BLDRNAME): $(BLDROBJS)
> 	$(LINKER) $(LDFLAGS) $^ -o $(BLDRBUILD)/$(BLDRNAME).bin

# Creates the object files for the linker ld
$(BLDRBUILD)/%.o: $(BLDRDIR)/%.$(ASMEXT) 	
	# $@, name of current file being generated (ex. %.o)
	# $^, name of all prerequisites
> 	$(AS) $(ASFLAGS) -o $@ $^

# KERNEL =======

$(KERNELNAME): $(KERNELOBJS)
> 	$(LINKER) -T $(KERNELDIR)/linker.ld -o $(KERNELBUILD)/$(KERNELNAME).elf $(KERNELSRCS)

$(KERNELBUILD)/%.o: $(KERNELDIR)/%.$(CEXT) $(KERNELDIR)/%.$(ASMEXT)
> 	$(AS) -ffreestanding -O2 -nostdlib -o $@ -c $^

.PHONY: clean # Makes sure that clean isn't seen as a file
clean:
> 	rm -rf *.o(N) *.(N)
