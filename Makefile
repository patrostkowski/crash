# Compiler and flags
CC      := gcc
CFLAGS  := -static # -std=c99 -Wall -Werror -Wextra -Iinclude -I./src/common

# Directories
SRC_DIR := src
BIN_DIR := bin

# List of source files in src/ (only .c files directly under src/)
SRC_FILES := $(wildcard $(SRC_DIR)/*.c)

# Create a list of target executables in bin/ with the same filename as the source (without extension)
TARGETS := $(patsubst $(SRC_DIR)/%.c, $(BIN_DIR)/%, $(SRC_FILES))

# Default target
all: $(TARGETS)

# Rule: Build each binary from its corresponding .c file.
$(BIN_DIR)/%: $(SRC_DIR)/%.c
	@mkdir -p $(BIN_DIR)
	$(CC) $(CFLAGS) $< -o $@

# Clean: Remove all built binaries.
clean:
	rm -rf $(BIN_DIR)/*

.PHONY: all clean