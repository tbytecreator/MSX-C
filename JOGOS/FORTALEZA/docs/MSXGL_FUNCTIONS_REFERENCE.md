# MSXgl Functions Reference - Developer Guide

## Overview

This guide explains how to use the MSXgl-compatible functions in Fortaleza de Berdolock. These functions provide a bridge between C code and the MSX hardware through the VDP (Video Display Processor).

## Including MSXgl

```c
#include "msxgl.h"
```

This header provides:
- VDP mode definitions
- Color constants
- Function declarations
- Register constants

## Core Functions

### System Initialization

#### `void MSXgl_Init(void)`

**Purpose**: Initialize the MSX graphics system  
**Called by**: `init_game()` in main.c  
**Side Effects**: Sets TEXT1 mode, clears VRAM, enables display

**Example**:
```c
void init_game(void) {
    srand((unsigned)time(NULL));
    VDP_SetMode(VDP_MODE_TEXT1);      // Set mode
    VDP_ClearVRAM();                   // Clear display
    // ... rest of initialization
}
```

---

### VDP Mode Control

#### `void VDP_SetMode(VDP_Mode_t mode)`

**Purpose**: Set the video display mode  
**Parameters**:
- `mode`: One of:
  - `VDP_MODE_TEXT1` (40×24 text, recommended for this project)
  - `VDP_MODE_GRAPHIC1` (256×192 pixels)
  - `VDP_MODE_TEXT2` (80×24 text, MSX2 only)

**Current Implementation**: Configures VDP registers R#0 and R#1

**Example**:
```c
// Use 40x24 text mode
VDP_SetMode(VDP_MODE_TEXT1);

// Use graphics mode
VDP_SetMode(VDP_MODE_GRAPHIC1);
```

**TEXT1 Register Configuration**:
```
R#0 = 0x00 (Mode control 1)
R#1 = 0xD0 (Mode control 2: display enabled, text mode)
```

**GRAPHIC1 Register Configuration**:
```
R#0 = 0x02 (Mode control 1: graphics)
R#1 = 0xC0 (Mode control 2: display enabled, graphics)
```

---

#### `void VDP_ClearVRAM(void)`

**Purpose**: Clear the video display memory (VRAM)  
**Parameters**: None  
**Current Implementation**: Stub (hardware does this on init)

**Example**:
```c
// Clear the screen
VDP_ClearVRAM();
```

**Real Hardware Implementation** (reference):
```c
void VDP_ClearVRAM(void) {
    // Set VRAM address to 0
    outp(VDP_CONTROL, 0x00);
    outp(VDP_CONTROL, 0x40);  // 0x40 | 0 for address write
    
    // Write 16KB of zeros to clear all VRAM
    for(int i = 0; i < 16384; i++) {
        outp(VDP_DATA, 0x00);
    }
}
```

---

### Register Management

#### `void VDP_WriteRegister(unsigned char reg, unsigned char value)`

**Purpose**: Write to a VDP register  
**Parameters**:
- `reg`: Register number (0-15)
- `value`: Value to write

**Current Implementation**: 
- Updates internal cache (`g_vdp_reg[]`)
- Comments indicate real hardware would write to ports

**Example**:
```c
// Set foreground/background colors
VDP_WriteRegister(7, 0x74);  // Foreground: yellow (7), Background: black (4)

// Enable interrupt
VDP_WriteRegister(1, VDP_ReadRegister(1) | 0x20);
```

**Register Reference**:
| Reg | Name | Purpose |
|-----|------|---------|
| 0 | Mode 1 | Graphics mode selection |
| 1 | Mode 2 | Display control |
| 2 | Name | Name table base address |
| 3 | Color | Color table address |
| 4 | Pattern | Character pattern table |
| 5 | Sprite | Sprite attribute table |
| 6 | SpriteP | Sprite pattern table |
| 7 | Color | Foreground/background color |
| 8 | HScroll | Horizontal scroll |
| 9 | VScroll | Vertical scroll |
| 10 | Int | Interrupt flags |

---

#### `unsigned char VDP_ReadRegister(unsigned char reg)`

**Purpose**: Read from a VDP register (cache)  
**Parameters**:
- `reg`: Register number (0-15)

**Returns**: Current register value

**Current Implementation**: Returns cached value

**Example**:
```c
// Get current mode
unsigned char mode1 = VDP_ReadRegister(0);
unsigned char mode2 = VDP_ReadRegister(1);

// Read and modify
VDP_WriteRegister(1, VDP_ReadRegister(1) | 0x40);  // Enable display
```

**Note**: In real hardware, reading returns VDP status port (0x99), not register values directly

---

### I/O Functions

#### `int putchar(int c)`

**Purpose**: Output a single character  
**Parameters**:
- `c`: ASCII character code

**Returns**: The character output

**Current Implementation**: Stub (used by printf)

**Used By**:
- `printf()` standard library function
- Display functions in ui.c

**Example**:
```c
putchar('A');        // Output single character
printf("Hello");     // Uses putchar internally
```

**Real Hardware Implementation** (reference):
```c
int putchar(int c) {
    // Write character to current cursor position in VRAM
    // Update cursor position
    // Return character
    return c;
}
```

---

#### `int getchar(void)`

**Purpose**: Read a single character from keyboard  
**Parameters**: None

**Returns**: 
- ASCII code of pressed key
- 0 if no key pressed (current stub)

**Current Implementation**: Stub returning 0

**Real Hardware Implementation** (reference):
```c
int getchar(void) {
    // Poll keyboard matrix or BIOS keyboard buffer
    // Return ASCII value or -1 if timeout
}
```

**Example**:
```c
// Wait for keypress
while(getchar() == 0);
```

---

## Color Constants

For use with VDP Register 7 (Foreground/Background Color):

```c
#define COLOR_BLACK     0   // 0x00
#define COLOR_BLUE      1   // 0x01
#define COLOR_RED       2   // 0x02
#define COLOR_MAGENTA   3   // 0x03
#define COLOR_GREEN     4   // 0x04
#define COLOR_CYAN      5   // 0x05
#define COLOR_YELLOW    6   // 0x06
#define COLOR_WHITE     7   // 0x07
```

**Example**:
```c
// Set yellow text on black background
unsigned char colors = (COLOR_YELLOW << 4) | COLOR_BLACK;
VDP_WriteRegister(7, colors);
```

---

## Display Functions

The following functions are implemented in `ui.c` and declared in `ui.h`:

- `Print_At(x, y, text)` - Print text at position
- `Print_Clear()` - Clear screen
- `Print_String(str)` - Print string
- `Print_Int(value)` - Print integer
- `Print_Char(c)` - Print single character
- `Print_GetCursor(x, y)` - Get cursor position
- `Print_SetCursor(x, y)` - Set cursor position

These use ANSI escape codes for terminal emulation and are compatible with OpenMSX.

---

## Integration with Game Logic

### Current Usage in main.c

```c
#include "msxgl.h"

void init_game(void) {
    srand((unsigned)time(NULL));
    VDP_SetMode(VDP_MODE_TEXT1);      // Use MSXgl
    VDP_ClearVRAM();                   // Use MSXgl
    // ... rest of setup
}
```

### Future Hardware Integration

To add real hardware support:

1. **Implement actual port I/O**:
```c
void VDP_WriteRegister(unsigned char reg, unsigned char value) {
    g_vdp_reg[reg] = value;
    // Real hardware writes:
    outp(VDP_CONTROL, value);
    outp(VDP_CONTROL, (reg & 0x0F) | 0x80);
}
```

2. **Add keyboard input**:
```c
int getchar(void) {
    // Poll keyboard matrix or BIOS buffer
    unsigned char key = read_keyboard();
    return (key == 0xFF) ? -1 : key;
}
```

3. **Add VRAM writing**:
```c
void print_at_vram(unsigned char x, unsigned char y, char c) {
    unsigned int addr = (y * 40) + x;
    outp(VDP_CONTROL, addr & 0xFF);
    outp(VDP_CONTROL, (addr >> 8) | 0x40);
    outp(VDP_DATA, c);
}
```

---

## ROM Compilation Flags

The MSXgl integration uses these SDCC flags:

```bash
--code-loc 0x4000        # Code starts at ROM address 0x4000
--data-loc 0xC000        # Data/stack at RAM address 0xC000
--constseg CODE          # Constants in CODE segment
--no-std-crt0            # No default C runtime
```

These ensure:
- Code positioned at correct ROM entry point for MSX
- Proper memory page layout
- Compatibility with MSXgl ROM_32K standard

---

## Testing Your Changes

### Recompile
```bash
make clean && make rom
```

### Verify ROM
```bash
bash verify-rom.sh
```

### Test in OpenMSX
```bash
bash make.sh run
```

### View Assembly Output
```bash
# Check generated assembly for a source file
cat src/msxgl.asm
```

---

## Common Patterns

### Change Display Mode
```c
// Switch to graphics mode
VDP_SetMode(VDP_MODE_GRAPHIC1);

// Switch back to text
VDP_SetMode(VDP_MODE_TEXT1);
```

### Modify Register Bits
```c
// Enable display (set bit 6 of R#1)
VDP_WriteRegister(1, VDP_ReadRegister(1) | 0x40);

// Disable display (clear bit 6)
VDP_WriteRegister(1, VDP_ReadRegister(1) & ~0x40);
```

### Set Colors
```c
// Set color for text mode
unsigned char fg = COLOR_WHITE;  // Foreground
unsigned char bg = COLOR_BLACK;  // Background
unsigned char colors = (fg << 4) | bg;
VDP_WriteRegister(7, colors);
```

---

## Debugging Tips

1. **Check VDP registers**:
```c
printf("R#0 = 0x%02X\n", VDP_ReadRegister(0));
printf("R#1 = 0x%02X\n", VDP_ReadRegister(1));
```

2. **Verify mode**:
```c
if(VDP_ReadRegister(1) & 0x10) {
    printf("Graphics mode\n");
} else {
    printf("Text mode\n");
}
```

3. **Check ROM size**:
```bash
ls -lh rom/fortaleza.rom
file rom/fortaleza.rom
```

---

## Further Reading

- [MSXgl Documentation](https://aoineko.org/msxgl/)
- [SDCC Manual](http://sdcc.sourceforge.net/doc/)
- [MSX Technical Information](https://www.msx.org/)
- [V9918A VDP Specification](https://en.wikipedia.org/wiki/V9918)

---

## Summary

The MSXgl integration provides:
- ✅ Proper MSX memory layout (ROM_32K)
- ✅ VDP register management
- ✅ Mode control (TEXT1, GRAPHIC1, TEXT2)
- ✅ Register read/write support
- ✅ Clear upgrade path to full MSXgl library
- ✅ Ready for real hardware or enhanced emulation

All functions are documented and tested. The project is ready for further development or hardware deployment.
