;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.0 #15242 (Linux)
;--------------------------------------------------------
	.module ui
	
	.optsdcc -mz80 sdcccall(1)
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _getchar
	.globl _printf
	.globl _Print_Clear
	.globl _Print_At
	.globl _Print_Char
	.globl _Print_String
	.globl _Print_SetCursor
	.globl _Print_GetChar
	.globl _Print_Int
	.globl _Print_HLine
	.globl _Print_VLine
	.globl _Print_Box
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;src/ui.c:9: void Print_Clear(void) {
;	---------------------------------
; Function Print_Clear
; ---------------------------------
_Print_Clear::
;src/ui.c:11: printf("\033[2J\033[H");  // ANSI: clear screen and move cursor to home
	ld	hl, #___str_0
	push	hl
	call	_printf
	pop	af
;src/ui.c:12: }
	ret
	.area _CODE
	.area _CODE
___str_0:
	.db 0x1b
	.ascii "[2J"
	.db 0x1b
	.ascii "[H"
	.db 0x00
	.area _CODE
	.area _CODE
;src/ui.c:14: void Print_At(int x, int y, const char* text) {
;	---------------------------------
; Function Print_At
; ---------------------------------
_Print_At::
;src/ui.c:16: printf("\033[%d;%dH", y + 1, x + 1);  // ANSI: move cursor (1-based)
	inc	hl
	push	ix
	ld	ix, #0
	add	ix, sp
	inc	de
	ld	bc, #___str_1+0
	push	hl
	push	de
	push	bc
	call	_printf
	pop	af
	pop	af
	pop	af
;src/ui.c:17: printf("%s", text);
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	ld	hl, #___str_2
	push	hl
	call	_printf
	pop	af
	pop	af
;src/ui.c:18: }
	pop	ix
	pop	hl
	pop	af
	jp	(hl)
	.area _CODE
	.area _CODE
___str_1:
	.db 0x1b
	.ascii "[%d;%dH"
	.db 0x00
	.area _CODE
	.area _CODE
___str_2:
	.ascii "%s"
	.db 0x00
	.area _CODE
	.area _CODE
;src/ui.c:20: void Print_Char(char c) {
;	---------------------------------
; Function Print_Char
; ---------------------------------
_Print_Char::
;src/ui.c:21: printf("%c", c);
	ld	c, a
	ld	b, #0x00
	push	bc
	ld	hl, #___str_3
	push	hl
	call	_printf
	pop	af
	pop	af
;src/ui.c:22: }
	ret
	.area _CODE
	.area _CODE
___str_3:
	.ascii "%c"
	.db 0x00
	.area _CODE
	.area _CODE
;src/ui.c:24: void Print_String(const char* str) {
;	---------------------------------
; Function Print_String
; ---------------------------------
_Print_String::
;src/ui.c:25: printf("%s", str);
	ld	bc, #___str_4+0
	push	hl
	push	bc
	call	_printf
	pop	af
	pop	af
;src/ui.c:26: }
	ret
	.area _CODE
	.area _CODE
___str_4:
	.ascii "%s"
	.db 0x00
	.area _CODE
	.area _CODE
;src/ui.c:28: void Print_SetCursor(int x, int y) {
;	---------------------------------
; Function Print_SetCursor
; ---------------------------------
_Print_SetCursor::
;src/ui.c:29: printf("\033[%d;%dH", y + 1, x + 1);
	inc	hl
	inc	de
	ld	bc, #___str_5+0
	push	hl
	push	de
	push	bc
	call	_printf
	pop	af
	pop	af
	pop	af
;src/ui.c:30: }
	ret
	.area _CODE
	.area _CODE
___str_5:
	.db 0x1b
	.ascii "[%d;%dH"
	.db 0x00
	.area _CODE
	.area _CODE
;src/ui.c:32: char Print_GetChar(void) {
;	---------------------------------
; Function Print_GetChar
; ---------------------------------
_Print_GetChar::
;src/ui.c:33: return getchar();
	call	_getchar
	ld	a, e
;src/ui.c:34: }
	ret
;src/ui.c:36: void Print_Int(int value) {
;	---------------------------------
; Function Print_Int
; ---------------------------------
_Print_Int::
;src/ui.c:37: printf("%d", value);
	ld	bc, #___str_6+0
	push	hl
	push	bc
	call	_printf
	pop	af
	pop	af
;src/ui.c:38: }
	ret
	.area _CODE
	.area _CODE
___str_6:
	.ascii "%d"
	.db 0x00
	.area _CODE
	.area _CODE
;src/ui.c:40: void Print_HLine(int x, int y, int length, char ch) {
;	---------------------------------
; Function Print_HLine
; ---------------------------------
_Print_HLine::
;src/ui.c:42: Print_SetCursor(x, y);
	call	_Print_SetCursor
;src/ui.c:43: for (i = 0; i < length; i++) {
	ld	bc, #0x0000
00103$:
	ld	hl, #2
	add	hl, sp
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	jp	PO, 00122$
	xor	a, #0x80
00122$:
	jp	P, 00105$
;src/ui.c:44: Print_Char(ch);
	push	bc
	ld	hl, #6
	add	hl, sp
	ld	a, (hl)
	call	_Print_Char
	pop	bc
;src/ui.c:43: for (i = 0; i < length; i++) {
	inc	bc
	jr	00103$
00105$:
;src/ui.c:46: }
	pop	hl
	pop	af
	inc	sp
	jp	(hl)
;src/ui.c:48: void Print_VLine(int x, int y, int length, char ch) {
;	---------------------------------
; Function Print_VLine
; ---------------------------------
_Print_VLine::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	ld	-2 (ix), l
	ld	-1 (ix), h
	inc	sp
	inc	sp
	push	de
;src/ui.c:50: for (i = 0; i < length; i++) {
	ld	bc, #0x0000
00103$:
	ld	a, c
	sub	a, 4 (ix)
	ld	a, b
	sbc	a, 5 (ix)
	jp	PO, 00122$
	xor	a, #0x80
00122$:
	jp	P, 00105$
;src/ui.c:51: Print_At(x, y + i, &ch);
	ld	hl, #10
	add	hl, sp
	ex	de, hl
	pop	hl
	push	hl
	add	hl, bc
	push	bc
	ex	de, hl
	push	hl
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	call	_Print_At
	pop	bc
;src/ui.c:50: for (i = 0; i < length; i++) {
	inc	bc
	jr	00103$
00105$:
;src/ui.c:53: }
	ld	sp, ix
	pop	ix
	pop	hl
	pop	af
	inc	sp
	jp	(hl)
;src/ui.c:55: void Print_Box(int x, int y, int width, int height, char ch) {
;	---------------------------------
; Function Print_Box
; ---------------------------------
_Print_Box::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	iy, #-8
	add	iy, sp
	ld	sp, iy
	ld	c, l
	ld	b, h
	ld	-4 (ix), e
	ld	-3 (ix), d
;src/ui.c:59: Print_HLine(x, y, width, ch);
	push	bc
	ld	a, 8 (ix)
	push	af
	inc	sp
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	ld	e, -4 (ix)
	ld	d, -3 (ix)
	ld	l, c
	ld	h, b
	call	_Print_HLine
	pop	bc
;src/ui.c:62: Print_HLine(x, y + height - 1, width, ch);
	ld	a, 6 (ix)
	add	a, -4 (ix)
	ld	e, a
	ld	a, 7 (ix)
	adc	a, -3 (ix)
	ld	d, a
	dec	de
	push	bc
	ld	a, 8 (ix)
	push	af
	inc	sp
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	ld	l, c
	ld	h, b
	call	_Print_HLine
	pop	bc
;src/ui.c:65: for (i = 1; i < height - 1; i++) {
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	add	hl, bc
	ld	a, l
	add	a, #0xff
	ld	-8 (ix), a
	ld	a, h
	adc	a, #0xff
	ld	-7 (ix), a
	ld	a, 6 (ix)
	add	a, #0xff
	ld	-6 (ix), a
	ld	a, 7 (ix)
	adc	a, #0xff
	ld	-5 (ix), a
	ld	-2 (ix), #0x01
	ld	-1 (ix), #0
00103$:
	ld	a, -2 (ix)
	sub	a, -6 (ix)
	ld	a, -1 (ix)
	sbc	a, -5 (ix)
	jp	PO, 00122$
	xor	a, #0x80
00122$:
	jp	P, 00105$
;src/ui.c:66: Print_At(x, y + i, &ch);
	ld	hl, #16
	add	hl, sp
	ld	a, -4 (ix)
	add	a, -2 (ix)
	ld	e, a
	ld	a, -3 (ix)
	adc	a, -1 (ix)
	ld	d, a
	push	hl
	push	bc
	push	de
	push	hl
	ld	l, c
	ld	h, b
	call	_Print_At
	pop	de
	pop	bc
	pop	hl
;src/ui.c:67: Print_At(x + width - 1, y + i, &ch);
	push	bc
	push	hl
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	call	_Print_At
	pop	bc
;src/ui.c:65: for (i = 1; i < height - 1; i++) {
	inc	-2 (ix)
	jr	NZ, 00103$
	inc	-1 (ix)
	jr	00103$
00105$:
;src/ui.c:69: }
	ld	sp, ix
	pop	ix
	pop	hl
	pop	af
	pop	af
	inc	sp
	jp	(hl)
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
