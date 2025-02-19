# Subproject targets
SUBPROJECTS := main

# Common directories
CPR_ROOT := $(shell pwd)
CPR_MAKEFILES := $(CPR_ROOT)/makefiles

include $(CPR_MAKEFILES)/Colors.mk

# Default target
.PHONY: all
all: $(SUBPROJECTS)
	@$(foreach dir,$(SUBPROJECTS),echo "$(WHT)>$(RST) Building subproject $(dir)"; $(MAKE) -C $(dir) CPR_ROOT=$(CPR_ROOT) CPR_MAKEFILES=$(CPR_MAKEFILES);)

# Build targets
.PHONY: ccjson clean
include $(CPR_MAKEFILES)/Utility.mk
