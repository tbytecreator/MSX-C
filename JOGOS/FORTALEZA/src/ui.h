#ifndef __UI_H__
#define __UI_H__

// ============================================================================
// UI Functions
// ============================================================================

/**
 * Clear the screen
 */
void Print_Clear(void);

/**
 * Print text at specific position (X, Y)
 * X: column (0-39)
 * Y: row (0-23)
 */
void Print_At(int x, int y, const char* text);

/**
 * Print a character at current cursor position
 */
void Print_Char(char c);

/**
 * Print a string at current cursor position
 */
void Print_String(const char* str);

/**
 * Move cursor to specific position
 */
void Print_SetCursor(int x, int y);

/**
 * Get character from keyboard input
 */
char Print_GetChar(void);

/**
 * Print integer at current cursor position
 */
void Print_Int(int value);

/**
 * Draw a horizontal line
 */
void Print_HLine(int x, int y, int length, char ch);

/**
 * Draw a vertical line
 */
void Print_VLine(int x, int y, int length, char ch);

/**
 * Draw a box
 */
void Print_Box(int x, int y, int width, int height, char ch);

#endif // __UI_H__
