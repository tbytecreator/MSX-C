#ifndef __MSXGL_H__
#define __MSXGL_H__

// ============================================================================
// MSXgl - MSX Graphics Library Header
// Fortaleza de Berdolock - Plain ROM 32KB (ROM_32K)
// ============================================================================
// Compatible with MSXgl library for MSX1 development
// Entry point: 0x4000 (ROM header)
// VDP: V9918A (MSX1 standard)
// RAM: ~16KB available after system variables

#include <stdio.h>

// ============================================================================
// VDP (Video Display Processor) Definitions
// ============================================================================

// VDP Modes (text and graphics)
typedef enum {
    VDP_MODE_TEXT1    = 0,      // 40x24 text, 1 color per char
    VDP_MODE_GRAPHIC1 = 1,      // 256x192 graphics, 16 colors per 8x8 block
    VDP_MODE_TEXT2    = 2,      // 80x24 text (MSX2)
} VDP_Mode_t;

// VDP Register constants
#define VDP_REG_MODE_0      0   // Mode control register 0
#define VDP_REG_MODE_1      1   // Mode control register 1
#define VDP_REG_NAME_ADDR   2   // Name table base address
#define VDP_REG_COLOR_ADDR  3   // Color table base address
#define VDP_REG_PATTERN_ADDR 4  // Pattern table base address
#define VDP_REG_SPRITE_ADDR 5   // Sprite attribute table address
#define VDP_REG_SPRITE_PTR  6   // Sprite pattern table base address
#define VDP_REG_TEXT_COLOR  7   // Foreground/background color
#define VDP_REG_H_SCROLL    8   // Horizontal scroll
#define VDP_REG_V_SCROLL    9   // Vertical scroll
#define VDP_REG_INT_FLAG    10  // Interrupt flags

// ============================================================================
// VDP Register Functions
// ============================================================================

void VDP_WriteRegister(unsigned char reg, unsigned char value);
unsigned char VDP_ReadRegister(unsigned char reg);
void VDP_SetMode(VDP_Mode_t mode);
void VDP_ClearVRAM(void);

// ============================================================================
// System Initialization
// ============================================================================

void MSXgl_Init(void);

// ============================================================================
// I/O Functions
// ============================================================================

// putchar and getchar are defined in <stdio.h>
// These are provided for MSX implementation in msxgl.c

// ============================================================================
// Display Functions (display.h compatible)
// ============================================================================

// Print text at position (x, y)
// x: 0-39 (for TEXT1 mode)
// y: 0-23
void Print_At(unsigned char x, unsigned char y, const char* text);

// Clear screen
void Print_Clear(void);

// Print string
void Print_String(const char* str);

// Print integer
void Print_Int(int value);

// Print character
void Print_Char(char c);

// Get cursor position
void Print_GetCursor(unsigned char* x, unsigned char* y);

// Set cursor position
void Print_SetCursor(unsigned char x, unsigned char y);

// ============================================================================
// Color Constants
// ============================================================================

#define COLOR_BLACK     0
#define COLOR_BLUE      1
#define COLOR_RED       2
#define COLOR_MAGENTA   3
#define COLOR_GREEN     4
#define COLOR_CYAN      5
#define COLOR_YELLOW    6
#define COLOR_WHITE     7

#endif // __MSXGL_H__
