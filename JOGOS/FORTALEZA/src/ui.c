#include <stdio.h>
#include <string.h>
#include "ui.h"

// ============================================================================
// UI Implementation
// ============================================================================

void Print_Clear(void) {
    // Clear screen using ANSI escape codes or simple printf
    printf("\033[2J\033[H");  // ANSI: clear screen and move cursor to home
}

void Print_At(int x, int y, const char* text) {
    // Move cursor to position and print text
    printf("\033[%d;%dH", y + 1, x + 1);  // ANSI: move cursor (1-based)
    printf("%s", text);
}

void Print_Char(char c) {
    printf("%c", c);
}

void Print_String(const char* str) {
    printf("%s", str);
}

void Print_SetCursor(int x, int y) {
    printf("\033[%d;%dH", y + 1, x + 1);
}

char Print_GetChar(void) {
    return getchar();
}

void Print_Int(int value) {
    printf("%d", value);
}

void Print_HLine(int x, int y, int length, char ch) {
    int i;
    Print_SetCursor(x, y);
    for (i = 0; i < length; i++) {
        Print_Char(ch);
    }
}

void Print_VLine(int x, int y, int length, char ch) {
    int i;
    for (i = 0; i < length; i++) {
        Print_At(x, y + i, &ch);
    }
}

void Print_Box(int x, int y, int width, int height, char ch) {
    int i;
    
    // Top line
    Print_HLine(x, y, width, ch);
    
    // Bottom line
    Print_HLine(x, y + height - 1, width, ch);
    
    // Left and right lines
    for (i = 1; i < height - 1; i++) {
        Print_At(x, y + i, &ch);
        Print_At(x + width - 1, y + i, &ch);
    }
}
