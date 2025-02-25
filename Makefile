.DELETE_ON_ERROR:
.RECIPEPREFIX = >

# CONSTANTS
AS = as
ASFLAGS = -g
ASMEXT = s
LINKER = ld
LDFLAGS += -static -nostdlib
SHELL := /bin/zsh

NAME = main

BUILDDIR = build
SRCDIR = kernel

# VARIABLES
# patsubst(PATTERN, REPLACEMENT, OBJS) - pattern substitution
KERNELSRCS := $(wildcard $(SRCDIR)/*.$(ASMEXT))
$(info KERNELSRCS = $(KERNELSRCS))
 
KERNELOBJS := $(patsubst $(SRCDIR)/%.$(ASMEXT),$(BUILDDIR)/%.o,$(KERNELSRCS))
$(info KERNELOBJS = $(KERNELOBJS))
	
# RULES
# Generates all executables
all: 	$(NAME)

# Links the executable
$(NAME): $(KERNELOBJS)
> 	$(LINKER) $(LDFLAGS) $^ -o $(NAME)

# Creates the object files for the linker ld
$(BUILDDIR)/%.o: $(SRCDIR)/%.$(ASMEXT) 	
	# $@, name of current file being generated (ex. %.o)
	# $^, name of all prerequisites
> 	$(AS) $(ASFLAGS) -o $@ $^


.PHONY: clean # Makes sure that clean isn't seen as a file
clean:
> 	rm -rf *.o(N) *.(N)
