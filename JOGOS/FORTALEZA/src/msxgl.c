// ============================================================================
// MSXgl - Stubs and Compatibility Layer
// ============================================================================
// Compatible with MSXgl library for plain ROM creation
// MSX1 32KB ROM target (ROM_32K: pages 1&2, 0x4000-0xBFFF)

#include "msxgl.h"

// ============================================================================
// VDP Port Addresses (MSX Standard)
// ============================================================================

#define VDP_DATA    0x98        // VDP data port
#define VDP_CONTROL 0x99        // VDP control/status port
#define PSG_PORT    0xA0        // PSG data port
#define PSG_SELECT  0xA1        // PSG register select

// ============================================================================
// VDP Register Cache
// ============================================================================

static unsigned char g_vdp_reg[16] = {0};  // VDP register cache (R0-R7 + R8-R15)
static unsigned char g_vdp_mode = 0;       // Current VDP mode

// ============================================================================
// VDP Functions - MSXgl compatible interface
// ============================================================================

/**
 * Write to VDP register
 * @param reg   - Register number (0-15)
 * @param value - Register value
 */
void VDP_WriteRegister(unsigned char reg, unsigned char value)
{
    if(reg < 16) {
        g_vdp_reg[reg] = value;
        // In real implementation: write to VDP_CONTROL port with:
        // value -> VDP_DATA
        // (reg & 0x0F) | 0x80 -> VDP_CONTROL
    }
}

/**
 * Read VDP register (from cache)
 * @param reg - Register number (0-15)
 * @return Register value
 */
unsigned char VDP_ReadRegister(unsigned char reg)
{
    if(reg < 16) {
        return g_vdp_reg[reg];
    }
    return 0;
}

/**
 * Set VDP mode
 * MSX standard modes:
 *   VDP_MODE_TEXT1 (0) = 40x24 text, 1 color per character
 *   VDP_MODE_GRAPHIC1 (1) = 256x192 pixels, 16 colors
 *   VDP_MODE_TEXT2 (2) = 80x24 text
 *   etc.
 */
void VDP_SetMode(VDP_Mode_t mode)
{
    g_vdp_mode = mode;
    
    // Configure VDP registers based on mode
    // Register 0 (R#0): Mode control 1
    // Register 1 (R#1): Mode control 2
    
    switch(mode) {
        case VDP_MODE_TEXT1:
            // 40x24 text mode
            VDP_WriteRegister(0, 0x00);      // R#0
            VDP_WriteRegister(1, 0xD0);      // R#1: Enable display, text mode
            break;
            
        case VDP_MODE_GRAPHIC1:
            // 256x192 pixel graphics mode
            VDP_WriteRegister(0, 0x02);      // R#0
            VDP_WriteRegister(1, 0xC0);      // R#1: Enable display, graphics mode
            break;
            
        case VDP_MODE_TEXT2:
            // 80x24 text mode
            VDP_WriteRegister(0, 0x00);      // R#0
            VDP_WriteRegister(1, 0xF0);      // R#1: Enable display, text mode 2
            break;
            
        default:
            // Fallback to TEXT1
            VDP_SetMode(VDP_MODE_TEXT1);
            break;
    }
}

/**
 * Clear VRAM (Video RAM)
 * Fills VRAM with zeros using VDP DMA operations
 */
void VDP_ClearVRAM(void)
{
    // In real implementation, would use VDP commands to clear VRAM
    // For emulator/stub: VRAM is initialized to zero on startup
    // 
    // Real MSX VDP DMA clear would:
    // 1. Set VRAM address to 0x0000
    // 2. Write zero through DMA for full VRAM size
}

// ============================================================================
// I/O Functions for Terminal Interface
// ============================================================================

/**
 * Output character (for printf support)
 * In real implementation, would write to VDP VRAM
 * Must match stdio.h signature: int putchar(int c)
 */
int putchar(int c)
{
    // Stub: In real MSX implementation, would:
    // 1. Update current cursor position in VRAM
    // 2. Write character to screen
    // 3. Update cursor
    
    // For emulator/debugging, character is already handled by stdio
    return c;
}

/**
 * Input character (for getchar support)
 * In real implementation, would read from keyboard buffer
 */
int getchar(void)
{
    // Stub: In real MSX implementation, would:
    // 1. Poll keyboard matrix or BIOS keyboard buffer
    // 2. Return ASCII value of pressed key
    // 3. Return -1 if no key pressed
    
    return 0;
}

// ============================================================================
// System Initialization (MSXgl compatible)
// ============================================================================

/**
 * Initialize MSXgl system
 * Called during ROM initialization before main()
 */
void MSXgl_Init(void)
{
    // Initialize VDP to default mode
    VDP_SetMode(VDP_MODE_TEXT1);
    
    // Clear VRAM
    VDP_ClearVRAM();
    
    // Enable display
    VDP_WriteRegister(1, VDP_ReadRegister(1) | 0x40);
}

// ============================================================================
// Note: Display functions (Print_At, Print_Clear, etc.) are implemented in ui.c
// They are declared in ui.h and available for use throughout the project
// ============================================================================
