# ============================================================================
# Fortaleza de Berdolock - Makefile for MSX
# ============================================================================

# Compiler and tools
CC = sdcc
OUTPUT_DIR = rom
DSK_DIR = dsk

# SDCC Flags for MSXgl ROM_32K:
# -mz80: Target Z80 processor
# --code-loc 0x4000: Code starts at 0x4000 (ROM page 1 for MSXgl ROM_32K)
# --data-loc 0xC000: Data starts at 0xC000 (page 3, RAM area)
# --no-std-crt0: Don't link default CRT0 (we have custom ROM header)
# --constseg CODE: Put constants in CODE segment
CFLAGS = -mz80 --code-loc 0x4000 --data-loc 0xC000 --constseg CODE --max-allocs-per-node 10000 --no-std-crt0
LDFLAGS =

# Source files
SOURCES = src/main.c src/game.c src/ui.c src/msxgl.c
OBJECTS = $(SOURCES:.c=.rel)

# Output files
ROM_FILE = $(OUTPUT_DIR)/fortaleza.rom
DSK_FILE = $(DSK_DIR)/fortaleza.dsk
HEX_FILE = fortaleza.hex

# Default target
all: rom

# Create ROM
rom: $(ROM_FILE)

$(ROM_FILE): $(OBJECTS)
	@mkdir -p $(OUTPUT_DIR)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $(ROM_FILE) $(OBJECTS)
	@echo "ROM created: $(ROM_FILE)"
	@bash ./pad-rom.sh

# Compile C files to object files
%.rel: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Create DSK (optional)
dsk: $(DSK_FILE)

$(DSK_FILE): $(ROM_FILE)
	@mkdir -p $(DSK_DIR)
	@echo "DSK creation not yet implemented"

# Clean build artifacts
clean:
	rm -f src/*.rel src/*.o src/*.lst src/*.sym
	rm -f *.hex *.cdb *.map *.mem

# Clean everything including outputs
distclean: clean
	rm -f $(ROM_FILE)
	rm -f $(DSK_FILE)

# Help
help:
	@echo "Available targets:"
	@echo "  make rom         - Build ROM file"
	@echo "  make dsk         - Build DSK file (placeholder)"
	@echo "  make clean       - Remove build artifacts"
	@echo "  make distclean   - Remove all generated files"
	@echo "  make help        - Show this help"

.PHONY: all rom dsk clean distclean help
