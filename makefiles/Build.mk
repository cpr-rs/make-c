include $(CPR_MAKEFILES)/Colors.mk

CC ?= gcc
PROJECT_ROOT := $(CPR_ROOT)/$(PROJECT_NAME)
BUILD_ROOT := $(CPR_ROOT)/build/$(PROJECT_NAME)

$(PROJECT_NAME)_SRCS ?=
$(PROJECT_NAME)_CFLAGS ?= -Wall -Wextra -O3 -I$(PROJECT_ROOT)/include
$(PROJECT_NAME)_LDFLAGS ?=

OBJS := $(patsubst %.c, $(BUILD_ROOT)/%.o, $($(PROJECT_NAME)_SRCS))

HEADERS := $(shell find $(PROJECT_ROOT)/include/ -name "*.h")

all: $(PROJECT_NAME)

$(PROJECT_NAME): $(BUILD_ROOT)/$(PROJECT_NAME)

$(BUILD_ROOT)/$(PROJECT_NAME): $(OBJS)
	@mkdir -p $(dir $@)
	@echo "$(CYN)>>$(RST) Linking $(basename $@)"
	@$(CC) $($(PROJECT_NAME)_LDFLAGS) -o $@ $(OBJS)

$(BUILD_ROOT)/%.o: $(PROJECT_ROOT)/%.c $(HEADERS)
	@mkdir -p $(dir $@)
	@echo "$(GRN)>>$(RST) Building CC target $(patsubst $(PROJECT_NAME)/%,%,$<)"
	@$(CC) $($(PROJECT_NAME)_CFLAGS) -I$(PROJECT_ROOT)/include -c $< -o $@
