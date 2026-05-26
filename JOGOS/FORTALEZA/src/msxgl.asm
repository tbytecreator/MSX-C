;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.0 #15242 (Linux)
;--------------------------------------------------------
	.module msxgl
	
	.optsdcc -mz80 sdcccall(1)
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _VDP_WriteRegister
	.globl _VDP_ReadRegister
	.globl _VDP_SetMode
	.globl _VDP_ClearVRAM
	.globl _putchar
	.globl _getchar
	.globl _MSXgl_Init
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
_g_vdp_reg:
	.ds 16
_g_vdp_mode:
	.ds 1
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
;src/msxgl.c:34: void VDP_WriteRegister(unsigned char reg, unsigned char value)
;	---------------------------------
; Function VDP_WriteRegister
; ---------------------------------
_VDP_WriteRegister::
	ld	c, a
	ld	e, l
;src/msxgl.c:36: if(reg < 16) {
	ld	a, c
	sub	a, #0x10
	ret	NC
;src/msxgl.c:37: g_vdp_reg[reg] = value;
	ld	hl, #_g_vdp_reg+0
	ld	b, #0x00
	add	hl, bc
	ld	(hl), e
;src/msxgl.c:42: }
	ret
;src/msxgl.c:49: unsigned char VDP_ReadRegister(unsigned char reg)
;	---------------------------------
; Function VDP_ReadRegister
; ---------------------------------
_VDP_ReadRegister::
;src/msxgl.c:51: if(reg < 16) {
	ld	e, a
	sub	a, #0x10
	jr	NC, 00102$
;src/msxgl.c:52: return g_vdp_reg[reg];
	ld	hl, #_g_vdp_reg+0
	ld	d, #0x00
	add	hl, de
	ld	a, (hl)
	ret
00102$:
;src/msxgl.c:54: return 0;
	xor	a, a
;src/msxgl.c:55: }
	ret
;src/msxgl.c:65: void VDP_SetMode(VDP_Mode_t mode)
;	---------------------------------
; Function VDP_SetMode
; ---------------------------------
_VDP_SetMode::
;src/msxgl.c:67: g_vdp_mode = mode;
	ld	(_g_vdp_mode+0), a
;src/msxgl.c:73: switch(mode) {
	or	a, a
	jr	Z, 00101$
	cp	a, #0x01
	jr	Z, 00102$
	sub	a, #0x02
	jr	Z, 00103$
	jr	00104$
;src/msxgl.c:74: case VDP_MODE_TEXT1:
00101$:
;src/msxgl.c:76: VDP_WriteRegister(0, 0x00);      // R#0
	xor	a, a
	ld	l, a
	call	_VDP_WriteRegister
;src/msxgl.c:77: VDP_WriteRegister(1, 0xD0);      // R#1: Enable display, text mode
	ld	l, #0xd0
;src/msxgl.c:78: break;
	ld	a, #0x01
	jp	_VDP_WriteRegister
;src/msxgl.c:80: case VDP_MODE_GRAPHIC1:
00102$:
;src/msxgl.c:82: VDP_WriteRegister(0, 0x02);      // R#0
	ld	l, #0x02
	xor	a, a
	call	_VDP_WriteRegister
;src/msxgl.c:83: VDP_WriteRegister(1, 0xC0);      // R#1: Enable display, graphics mode
	ld	l, #0xc0
;src/msxgl.c:84: break;
	ld	a, #0x01
	jp	_VDP_WriteRegister
;src/msxgl.c:86: case VDP_MODE_TEXT2:
00103$:
;src/msxgl.c:88: VDP_WriteRegister(0, 0x00);      // R#0
	xor	a, a
	ld	l, a
	call	_VDP_WriteRegister
;src/msxgl.c:89: VDP_WriteRegister(1, 0xF0);      // R#1: Enable display, text mode 2
	ld	l, #0xf0
;src/msxgl.c:90: break;
	ld	a, #0x01
	jp	_VDP_WriteRegister
;src/msxgl.c:92: default:
00104$:
;src/msxgl.c:94: VDP_SetMode(VDP_MODE_TEXT1);
	xor	a, a
;src/msxgl.c:96: }
;src/msxgl.c:97: }
	jr	_VDP_SetMode
;src/msxgl.c:103: void VDP_ClearVRAM(void)
;	---------------------------------
; Function VDP_ClearVRAM
; ---------------------------------
_VDP_ClearVRAM::
;src/msxgl.c:111: }
	ret
;src/msxgl.c:122: int putchar(int c)
;	---------------------------------
; Function putchar
; ---------------------------------
_putchar::
	ex	de, hl
;src/msxgl.c:130: return c;
;src/msxgl.c:131: }
	ret
;src/msxgl.c:137: int getchar(void)
;	---------------------------------
; Function getchar
; ---------------------------------
_getchar::
;src/msxgl.c:144: return 0;
	ld	de, #0x0000
;src/msxgl.c:145: }
	ret
;src/msxgl.c:155: void MSXgl_Init(void)
;	---------------------------------
; Function MSXgl_Init
; ---------------------------------
_MSXgl_Init::
;src/msxgl.c:158: VDP_SetMode(VDP_MODE_TEXT1);
	xor	a, a
	call	_VDP_SetMode
;src/msxgl.c:161: VDP_ClearVRAM();
	call	_VDP_ClearVRAM
;src/msxgl.c:164: VDP_WriteRegister(1, VDP_ReadRegister(1) | 0x40);
	ld	a, #0x01
	call	_VDP_ReadRegister
	or	a, #0x40
	ld	l, a
	ld	a, #0x01
;src/msxgl.c:165: }
	jp	_VDP_WriteRegister
	.area _CODE
	.area _CODE
	.area _INITIALIZER
__xinit__g_vdp_reg:
	.db #0x00	; 0
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
__xinit__g_vdp_mode:
	.db #0x00	; 0
	.area _CABS (ABS)
