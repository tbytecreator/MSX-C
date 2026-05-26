;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.0 #15242 (Linux)
;--------------------------------------------------------
	.module game
	
	.optsdcc -mz80 sdcccall(1)
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _rand
	.globl _roll_dice
	.globl _random_range
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
;src/game.c:8: int roll_dice(int num_dice, int sides) {
;	---------------------------------
; Function roll_dice
; ---------------------------------
_roll_dice::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	ld	c, l
	ld	b, h
	inc	sp
	inc	sp
	push	de
;src/game.c:9: int total = 0;
	ld	hl, #0x0000
;src/game.c:12: for (i = 0; i < num_dice; i++) {
	xor	a, a
	ld	-2 (ix), a
	ld	-1 (ix), a
00103$:
	ld	a, -2 (ix)
	sub	a, c
	ld	a, -1 (ix)
	sbc	a, b
	jp	PO, 00122$
	xor	a, #0x80
00122$:
	jp	P, 00101$
;src/game.c:13: total += (rand() % sides) + 1;
	push	hl
	push	bc
	call	_rand
	push	de
	pop	iy
	ld	e, -4 (ix)
	ld	d, -3 (ix)
	push	iy
	pop	hl
	call	__modsint
	pop	bc
	pop	hl
	inc	de
	add	hl, de
;src/game.c:12: for (i = 0; i < num_dice; i++) {
	inc	-2 (ix)
	jr	NZ, 00103$
	inc	-1 (ix)
	jr	00103$
00101$:
;src/game.c:16: return total;
	ex	de, hl
;src/game.c:17: }
	ld	sp, ix
	pop	ix
	ret
;src/game.c:19: int random_range(int min, int max) {
;	---------------------------------
; Function random_range
; ---------------------------------
_random_range::
;src/game.c:20: if (min >= max) return min;
	ld	a, l
	sub	a, e
	ld	a, h
	sbc	a, d
	jp	PO, 00112$
	xor	a, #0x80
00112$:
	jp	M, 00102$
	ex	de, hl
	ret
00102$:
;src/game.c:21: return min + (rand() % (max - min + 1));
	push	hl
	push	de
	call	_rand
	ld	c, e
	ld	b, d
	pop	de
	pop	hl
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	d, a
	inc	de
	push	hl
	ld	l, c
	ld	h, b
	call	__modsint
	pop	hl
	add	hl, de
	ex	de, hl
;src/game.c:22: }
	ret
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
