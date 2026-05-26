;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (Linux)
;--------------------------------------------------------
	.module memory
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Mem_DynamicMerge
	.globl _g_MemChunkRoot
	.globl _g_StackAddress
	.globl _Mem_GetStackAddress
	.globl _Mem_Set_16b
	.globl _Mem_DynamicInitialize
	.globl _Mem_DynamicAlloc
	.globl _Mem_DynamicFree
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_g_StackAddress::
	.ds 2
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_g_MemChunkRoot::
	.ds 2
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
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/memory.c:29: u16 Mem_GetStackAddress() __NAKED
;	---------------------------------
; Function Mem_GetStackAddress
; ---------------------------------
_Mem_GetStackAddress::
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/memory.c:35: __endasm;
	ld	(_g_StackAddress), sp
	ld	de, (_g_StackAddress)
	ret
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/memory.c:36: }
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/memory.c:150: void Mem_Set_16b(u16 val, void* dest, u16 size)
;	---------------------------------
; Function Mem_Set_16b
; ---------------------------------
_Mem_Set_16b::
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/memory.c:185: __endasm;
	push	de
	ex	de, hl
	ld	(hl), d
	inc	hl
	ld	(hl), e
	inc	hl
	ex	de, hl
	pop	hl
	pop	iy
	pop	bc
	dec	bc
	dec	bc
	ldir
	mem_fill16_end:
	jp	(iy)
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/memory.c:186: }
	pop	hl
	pop	af
	jp	(hl)
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/memory.c:258: void Mem_DynamicInitialize(void* base, u16 size)
;	---------------------------------
; Function Mem_DynamicInitialize
; ---------------------------------
_Mem_DynamicInitialize::
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/memory.c:260: g_MemChunkRoot = (MemChunkHeader*)base;
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/memory.c:261: g_MemChunkRoot->Size = (size - sizeof(MemChunkHeader)) | MEM_CHUNK_FREE;
	ld	(_g_MemChunkRoot), hl
	ld	a, e
	add	a, #0xfc
	ld	c, a
	ld	a, d
	adc	a, #0xff
	ld	b, a
	set	7, b
	ld	(hl), c
	inc	hl
	ld	(hl), b
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/memory.c:262: g_MemChunkRoot->Next = NULL;
	ld	hl, (_g_MemChunkRoot)
	inc	hl
	inc	hl
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/memory.c:263: }
	ret
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/memory.c:267: void* Mem_DynamicAlloc(u16 size)
;	---------------------------------
; Function Mem_DynamicAlloc
; ---------------------------------
_Mem_DynamicAlloc::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	iy, #-10
	add	iy, sp
	ld	sp, iy
	ld	-2 (ix), l
	ld	-1 (ix), h
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/memory.c:274: MemChunkHeader* chunk = g_MemChunkRoot;
	ld	de, (_g_MemChunkRoot)
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/memory.c:275: while (chunk)
00107$:
	ld	a, d
	or	a, e
	jp	Z, 00109$
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/memory.c:277: u16 chunkSize = chunk->Size;
	ld	l, e
	ld	h, d
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/memory.c:278: if (chunkSize & MEM_CHUNK_FREE) // Free chunk
	bit	7, h
	jp	Z,00106$
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/memory.c:280: chunkSize &= ~MEM_CHUNK_FREE;
	res	7, h
	ld	-4 (ix), l
	ld	-3 (ix), h
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/memory.c:281: if (chunkSize == size) // Re-use chunk
	ld	a, -2 (ix)
	sub	a, -4 (ix)
	jr	NZ, 00102$
	ld	a, -1 (ix)
	sub	a, -3 (ix)
	jr	NZ, 00102$
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/memory.c:283: chunk->Size &= ~MEM_CHUNK_FREE;
	res	7, b
	ld	l, e
	ld	h, d
	ld	(hl), c
	inc	hl
	ld	(hl), b
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/memory.c:284: return (void*)((u16)chunk + sizeof(MemChunkHeader));
	inc	de
	inc	de
	inc	de
	inc	de
	jp	00110$
00102$:
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/memory.c:286: u16 needSize = size + sizeof(MemChunkHeader);
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	ld	hl, #0x0004
	add	hl, bc
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/memory.c:287: if (chunkSize > needSize) // Create new sub-chunk
	ld	a, l
	sub	a, -4 (ix)
	ld	a, h
	sbc	a, -3 (ix)
	jr	NC, 00106$
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/memory.c:289: MemChunkHeader* newChunk = (MemChunkHeader*)((u16)chunk + needSize); // New free sub-chunk
	inc	sp
	inc	sp
	push	de
	ld	a, l
	add	a, -10 (ix)
	ld	c, a
	ld	a, h
	adc	a, -9 (ix)
	ld	b, a
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/memory.c:290: newChunk->Size = (chunkSize - needSize) | MEM_CHUNK_FREE;
	ld	a, -4 (ix)
	sub	a, l
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -3 (ix)
	sbc	a, h
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	set	7, h
	ld	-4 (ix), l
	ld	-3 (ix), h
	ld	l, c
	ld	h, b
	ld	a, -4 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -3 (ix)
	ld	(hl), a
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/memory.c:291: newChunk->Next = chunk->Next;
	ld	hl, #0x0002
	add	hl, bc
	ld	-8 (ix), l
	ld	-7 (ix), h
	ld	hl, #0x0002
	add	hl, de
	ld	-6 (ix), l
	ld	-5 (ix), h
	ld	a, (hl)
	ld	-4 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-3 (ix), a
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	ld	a, -4 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -3 (ix)
	ld	(hl), a
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/memory.c:293: chunk->Size = size; // Allocated sub-chunk
	ld	a, -2 (ix)
	ld	(de), a
	inc	de
	ld	a, -1 (ix)
	ld	(de), a
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/memory.c:294: chunk->Next = newChunk;
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/memory.c:296: return (void*)((u16)chunk + sizeof(MemChunkHeader));
	pop	de
	push	de
	inc	de
	inc	de
	inc	de
	inc	de
	jp	00110$
00106$:
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/memory.c:299: chunk = chunk->Next;
	ex	de, hl
	inc	hl
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	jp	00107$
00109$:
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/memory.c:301: return NULL;
	ld	de, #0x0000
00110$:
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/memory.c:302: }
	ld	sp, ix
	pop	ix
	ret
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/memory.c:306: void Mem_DynamicMerge()
;	---------------------------------
; Function Mem_DynamicMerge
; ---------------------------------
_Mem_DynamicMerge::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/memory.c:308: MemChunkHeader* chunk = g_MemChunkRoot;
	ld	bc, (_g_MemChunkRoot)
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/memory.c:309: while (chunk)
00105$:
	ld	a, b
	or	a, c
	jr	Z, 00108$
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/memory.c:311: MemChunkHeader* nextChunk = chunk->Next;
	ld	hl, #0x0002
	add	hl, bc
	ex	(sp), hl
	pop	hl
	push	hl
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/memory.c:312: if ((nextChunk != NULL) && (chunk->Size & MEM_CHUNK_FREE) && (nextChunk->Size & MEM_CHUNK_FREE))
	ld	-1 (ix), a
	or	a, -2 (ix)
	jr	Z, 00102$
	ld	l, c
	ld	h, b
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	bit	7, d
	jr	Z, 00102$
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	bit	7, h
	jr	Z, 00102$
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/memory.c:314: chunk->Size += nextChunk->Size + sizeof(MemChunkHeader);
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	add	hl, de
	ex	de, hl
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/memory.c:315: chunk->Next = nextChunk->Next;
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	pop	hl
	push	hl
	ld	(hl), c
	inc	hl
	ld	(hl), b
00102$:
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/memory.c:317: chunk = chunk->Next;
	pop	hl
	push	hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	jp	00105$
00108$:
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/memory.c:319: }
	ld	sp, ix
	pop	ix
	ret
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/memory.c:323: void Mem_DynamicFree(void* ptr)
;	---------------------------------
; Function Mem_DynamicFree
; ---------------------------------
_Mem_DynamicFree::
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/memory.c:325: MemChunkHeader* chunk = (MemChunkHeader*)((u16)ptr - sizeof(MemChunkHeader));
	ld	a, l
	add	a, #0xfc
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, h
	adc	a, #0xff
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/memory.c:326: chunk->Size |= MEM_CHUNK_FREE;
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	dec	hl
	set	7, b
	ld	(hl), c
	inc	hl
	ld	(hl), b
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/memory.c:327: Mem_DynamicMerge();
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/memory.c:328: }
	jp	_Mem_DynamicMerge
	.area _CODE
	.area _INITIALIZER
__xinit__g_MemChunkRoot:
	.dw #0x0000
	.area _CABS (ABS)
