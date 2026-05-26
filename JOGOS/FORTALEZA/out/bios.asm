;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (Linux)
;--------------------------------------------------------
	.module bios
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Sys_GetPageSlot
	.globl _g_SLTSL
	.globl _g_GRPACY
	.globl _g_GRPACX
	.globl _g_LOGOPR
	.globl _g_CMASK
	.globl _g_CLOC
	.globl _g_FNKSTR
	.globl _g_ATRBYT
	.globl _g_BDRCLR
	.globl _g_BAKCLR
	.globl _g_FORCLR
	.globl _g_CSRX
	.globl _g_CSRY
	.globl _g_CLIKSW
	.globl _g_MLTPAT
	.globl _g_MLTATR
	.globl _g_MLTCGP
	.globl _g_MLTCOL
	.globl _g_MLTNAM
	.globl _g_GRPPAT
	.globl _g_GRPATR
	.globl _g_GRPCGP
	.globl _g_GRPCOL
	.globl _g_GRPNAM
	.globl _g_T32PAT
	.globl _g_T32ATR
	.globl _g_T32CGP
	.globl _g_T32COL
	.globl _g_T32NAM
	.globl _g_TXTPAT
	.globl _g_TXTATR
	.globl _g_TXTCGP
	.globl _g_TXTCOL
	.globl _g_TXTNAM
	.globl _g_CLMLST
	.globl _g_CRTCNT
	.globl _g_LINLEN
	.globl _g_LINL32
	.globl _g_LINL40
	.globl _g_BDOS
	.globl _g_MASTER
	.globl _g_RAMAD3
	.globl _g_RAMAD2
	.globl _g_RAMAD1
	.globl _g_RAMAD0
	.globl _g_BREAKV
	.globl _g_DISKVE
	.globl _g_KANJTABLE
	.globl _g_STRSRC
	.globl _g_SUBRID
	.globl _g_CHAR_16
	.globl _g_MSXMID
	.globl _g_MSXVER
	.globl _g_ROMVersion
	.globl _g_BASRVN
	.globl _g_VDP_DW
	.globl _g_VDP_DR
	.globl _g_CGTABL
	.globl _g_SVFFFD
	.globl _g_RG27SAV
	.globl _g_RG26SAV
	.globl _g_RG25SAV
	.globl _g_SVFFF8
	.globl _g_MINROM
	.globl _g_RG23SAV
	.globl _g_RG22SAV
	.globl _g_RG21SAV
	.globl _g_RG20SAV
	.globl _g_RG19SAV
	.globl _g_RG18SAV
	.globl _g_RG17SAV
	.globl _g_RG16SAV
	.globl _g_RG15SAV
	.globl _g_RG14SAV
	.globl _g_RG13SAV
	.globl _g_RG12SAV
	.globl _g_RG11SAV
	.globl _g_RG10SAV
	.globl _g_RG09SAV
	.globl _g_RG08SAV
	.globl _g_PROCNM
	.globl _g_SLTWRK
	.globl _g_SLTATR
	.globl _g_SLTTBL
	.globl _g_EXPTBL
	.globl _g_MNROM
	.globl _g_DRWANG
	.globl _g_DRWSCL
	.globl _g_DRWFLG
	.globl _g_GYPOS
	.globl _g_GXPOS
	.globl _g_BRDATR
	.globl _g_CASPRV
	.globl _g_OLDSCR
	.globl _g_SCRMOD
	.globl _g_FLBMEM
	.globl _g_KANAMD
	.globl _g_KANAST
	.globl _g_CAPST
	.globl _g_CSTYLE
	.globl _g_CSRSW
	.globl _g_INSFLG
	.globl _g_ESCCNT
	.globl _g_GRPHED
	.globl _g_WINWID
	.globl _g_LOWLIM
	.globl _g_INTCNT
	.globl _g_INTVAL
	.globl _g_JIFFY
	.globl _g_PADX
	.globl _g_PADY
	.globl _g_INTFLG
	.globl _g_RTYCNT
	.globl _g_TRPTBL
	.globl _g_HIMEM
	.globl _g_BOTTOM
	.globl _g_PATWRK
	.globl _g_LINWRK
	.globl _g_KEYBUF
	.globl _g_NEWKEY
	.globl _g_OLDKEY
	.globl _g_CLIKFL
	.globl _g_ONGSBF
	.globl _g_FNKFLG
	.globl _g_FNKSWI
	.globl _g_CODSAV
	.globl _g_FSTPOS
	.globl _g_LINTTB
	.globl _g_BASROM
	.globl _g_ENSTOP
	.globl _g_VCBC
	.globl _g_VCBB
	.globl _g_VCBA
	.globl _g_PLYCNT
	.globl _g_MUSICF
	.globl _g_QUEUEN
	.globl _g_MCLPTR
	.globl _g_MCLLEN
	.globl _g_SAVVOL
	.globl _g_VOICEN
	.globl _g_SAVSP
	.globl _g_PRSCNT
	.globl _g_LSTMOD
	.globl _g_LSTCOM
	.globl _g_COMMSK
	.globl _g_ESTBLS
	.globl _g_FLAGS
	.globl _g_ERRORS
	.globl _g_DATCNT
	.globl _g_DEVNUM
	.globl _g_OLDINT
	.globl _g_OLDSTT
	.globl _g_MEXBIh
	.globl _g_RSIQLN
	.globl _g_RSFCB
	.globl _g_TOCNT
	.globl _g_RSTMP
	.globl _g_YSAVE
	.globl _g_XSAVE
	.globl _g_NORUSE
	.globl _g_MODE
	.globl _g_ROMA
	.globl _g_CHRCNT
	.globl _g_EXBRSA
	.globl _g_AVCSAV
	.globl _g_ACPAGE
	.globl _g_DPPAGE
	.globl _g_RS2IQ
	.globl _g_VOICCQ
	.globl _g_VOICBQ
	.globl _g_VOICAQ
	.globl _g_QUEBAK
	.globl _g_QUETAB
	.globl _g_ASPCT2
	.globl _g_ASPCT1
	.globl _g_HEADER
	.globl _g_HIGH
	.globl _g_LOW
	.globl _g_CS240
	.globl _g_CS120
	.globl _g_GETPNT
	.globl _g_PUTPNT
	.globl _g_REPCNT
	.globl _g_SCNCNT
	.globl _g_FRCNEW
	.globl _g_QUEUES
	.globl _g_MINUPD
	.globl _g_MAXUPD
	.globl _g_TRGFLG
	.globl _g_STATFL
	.globl _g_RG7SAV
	.globl _g_RG6SAV
	.globl _g_RG5SAV
	.globl _g_RG4SAV
	.globl _g_RG3SAV
	.globl _g_RG2SAV
	.globl _g_RG1SAV
	.globl _g_RG0SAV
	.globl _g_CNSDFG
	.globl _g_USRTAB
	.globl _g_CLPRIM
	.globl _g_WRPRIM
	.globl _g_RDPRIM
	.globl _BIOS_Exit
	.globl _BIOS_SetHookCallback
	.globl _BIOS_InterSlotRead
	.globl _BIOS_InterSlotWrite
	.globl _BIOS_InterSlotCall
	.globl _BIOS_SwitchSlot
	.globl _BIOS_WriteVDP
	.globl _BIOS_WriteVRAM
	.globl _BIOS_FillVRAM
	.globl _BIOS_CopyFromVRAM
	.globl _BIOS_CopyToVRAM
	.globl _BIOS_InitScreen3Ex
	.globl _BIOS_GetSpritePatternAddress
	.globl _BIOS_GetSpriteAttributeAddress
	.globl _BIOS_WritePSG
	.globl _BIOS_HasCharacter
	.globl _BIOS_ClearScreen
	.globl _BIOS_TextSetCursor
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
_g_PSG_RegPort	=	0x00a0
_g_PSG_DataPort	=	0x00a1
_g_PSG_StatPort	=	0x00a2
_g_PSG_Ext_RegPort	=	0x0010
_g_PSG_Ext_DataPort	=	0x0011
_g_PSG_Ext_StatPort	=	0x0012
_g_Printer_ControlPort	=	0x0090
_g_Printer_DataPort	=	0x0091
_g_MSXMusic_IndexPort	=	0x007c
_g_VDP_DataPort	=	0x0098
_g_VDP_RegPort	=	0x0099
_g_VDP_AddrPort	=	0x0099
_g_VDP_StatPort	=	0x0099
_g_PortPrimarySlot	=	0x00a8
_g_PortReadKeyboard	=	0x00a9
_g_PortAccessKeyboard	=	0x00aa
_g_PortControl	=	0x00ab
_g_RTC_AddrPort	=	0x00b4
_g_RTC_DataPort	=	0x00b5
_g_MSXAudio_IndexPort	=	0x00c0
_g_MSXAudio_DataPort	=	0x00c1
_g_MSXAudio_IndexPort2	=	0x00c2
_g_MSXAudio_DataPort2	=	0x00c3
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_g_LINL40	=	0xf3ae
_g_LINL32	=	0xf3af
_g_LINLEN	=	0xf3b0
_g_CRTCNT	=	0xf3b1
_g_CLMLST	=	0xf3b2
_g_TXTNAM	=	0xf3b3
_g_TXTCOL	=	0xf3b5
_g_TXTCGP	=	0xf3b7
_g_TXTATR	=	0xf3b9
_g_TXTPAT	=	0xf3bb
_g_T32NAM	=	0xf3bd
_g_T32COL	=	0xf3bf
_g_T32CGP	=	0xf3c1
_g_T32ATR	=	0xf3c3
_g_T32PAT	=	0xf3c5
_g_GRPNAM	=	0xf3c7
_g_GRPCOL	=	0xf3c9
_g_GRPCGP	=	0xf3cb
_g_GRPATR	=	0xf3cd
_g_GRPPAT	=	0xf3cf
_g_MLTNAM	=	0xf3d1
_g_MLTCOL	=	0xf3d3
_g_MLTCGP	=	0xf3d5
_g_MLTATR	=	0xf3d7
_g_MLTPAT	=	0xf3d9
_g_CLIKSW	=	0xf3db
_g_CSRY	=	0xf3dc
_g_CSRX	=	0xf3dd
_g_FORCLR	=	0xf3e9
_g_BAKCLR	=	0xf3ea
_g_BDRCLR	=	0xf3eb
_g_ATRBYT	=	0xf3f2
_g_FNKSTR	=	0xf87f
_g_CLOC	=	0xf92a
_g_CMASK	=	0xf92c
_g_LOGOPR	=	0xfb02
_g_GRPACX	=	0xfcb7
_g_GRPACY	=	0xfcb9
_g_SLTSL	=	0xffff
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
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios.c:28: void BIOS_Exit(u8 ret)
;	---------------------------------
; Function BIOS_Exit
; ---------------------------------
_BIOS_Exit::
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios.c:74: __endasm;
	call	0x0000
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios.c:77: }
	ret
_g_RDPRIM	=	0xf380
_g_WRPRIM	=	0xf385
_g_CLPRIM	=	0xf38c
_g_USRTAB	=	0xf39a
_g_CNSDFG	=	0xf3de
_g_RG0SAV	=	0xf3df
_g_RG1SAV	=	0xf3e0
_g_RG2SAV	=	0xf3e1
_g_RG3SAV	=	0xf3e2
_g_RG4SAV	=	0xf3e3
_g_RG5SAV	=	0xf3e4
_g_RG6SAV	=	0xf3e5
_g_RG7SAV	=	0xf3e6
_g_STATFL	=	0xf3e7
_g_TRGFLG	=	0xf3e8
_g_MAXUPD	=	0xf3ec
_g_MINUPD	=	0xf3ef
_g_QUEUES	=	0xf3f3
_g_FRCNEW	=	0xf3f5
_g_SCNCNT	=	0xf3f6
_g_REPCNT	=	0xf3f7
_g_PUTPNT	=	0xf3f8
_g_GETPNT	=	0xf3fa
_g_CS120	=	0xf3fc
_g_CS240	=	0xf401
_g_LOW	=	0xf406
_g_HIGH	=	0xf408
_g_HEADER	=	0xf40a
_g_ASPCT1	=	0xf40b
_g_ASPCT2	=	0xf40d
_g_QUETAB	=	0xf959
_g_QUEBAK	=	0xf971
_g_VOICAQ	=	0xf975
_g_VOICBQ	=	0xf9f5
_g_VOICCQ	=	0xfa75
_g_RS2IQ	=	0xfaf5
_g_DPPAGE	=	0xfaf5
_g_ACPAGE	=	0xfaf6
_g_AVCSAV	=	0xfaf7
_g_EXBRSA	=	0xfaf8
_g_CHRCNT	=	0xfaf9
_g_ROMA	=	0xfafa
_g_MODE	=	0xfafc
_g_NORUSE	=	0xfafd
_g_XSAVE	=	0xfafe
_g_YSAVE	=	0xfb00
_g_RSTMP	=	0xfb03
_g_TOCNT	=	0xfb03
_g_RSFCB	=	0xfb04
_g_RSIQLN	=	0xfb06
_g_MEXBIh	=	0xfb07
_g_OLDSTT	=	0xfb0c
_g_OLDINT	=	0xfb0c
_g_DEVNUM	=	0xfb16
_g_DATCNT	=	0xfb17
_g_ERRORS	=	0xfb1a
_g_FLAGS	=	0xfb1b
_g_ESTBLS	=	0xfb1c
_g_COMMSK	=	0xfb1d
_g_LSTCOM	=	0xfb1e
_g_LSTMOD	=	0xfb1f
_g_PRSCNT	=	0xfb35
_g_SAVSP	=	0xfb36
_g_VOICEN	=	0xfb38
_g_SAVVOL	=	0xfb39
_g_MCLLEN	=	0xfb3b
_g_MCLPTR	=	0xfb3c
_g_QUEUEN	=	0xfb3e
_g_MUSICF	=	0xfb3f
_g_PLYCNT	=	0xfb40
_g_VCBA	=	0xfb41
_g_VCBB	=	0xfb66
_g_VCBC	=	0xfb8b
_g_ENSTOP	=	0xfbb0
_g_BASROM	=	0xfbb1
_g_LINTTB	=	0xfbb2
_g_FSTPOS	=	0xfbca
_g_CODSAV	=	0xfbcc
_g_FNKSWI	=	0xfbcd
_g_FNKFLG	=	0xfbce
_g_ONGSBF	=	0xfbd8
_g_CLIKFL	=	0xfbd9
_g_OLDKEY	=	0xfbda
_g_NEWKEY	=	0xfbe5
_g_KEYBUF	=	0xfbf0
_g_LINWRK	=	0xfc18
_g_PATWRK	=	0xfc40
_g_BOTTOM	=	0xfc48
_g_HIMEM	=	0xfc4a
_g_TRPTBL	=	0xfc4c
_g_RTYCNT	=	0xfc9a
_g_INTFLG	=	0xfc9b
_g_PADY	=	0xfc9c
_g_PADX	=	0xfc9d
_g_JIFFY	=	0xfc9e
_g_INTVAL	=	0xfca0
_g_INTCNT	=	0xfca2
_g_LOWLIM	=	0xfca4
_g_WINWID	=	0xfca5
_g_GRPHED	=	0xfca6
_g_ESCCNT	=	0xfca7
_g_INSFLG	=	0xfca8
_g_CSRSW	=	0xfca9
_g_CSTYLE	=	0xfcaa
_g_CAPST	=	0xfcab
_g_KANAST	=	0xfcac
_g_KANAMD	=	0xfcad
_g_FLBMEM	=	0xfcae
_g_SCRMOD	=	0xfcaf
_g_OLDSCR	=	0xfcb0
_g_CASPRV	=	0xfcb1
_g_BRDATR	=	0xfcb2
_g_GXPOS	=	0xfcb3
_g_GYPOS	=	0xfcb5
_g_DRWFLG	=	0xfcbb
_g_DRWSCL	=	0xfcbc
_g_DRWANG	=	0xfcbd
_g_MNROM	=	0xfcc1
_g_EXPTBL	=	0xfcc1
_g_SLTTBL	=	0xfcc5
_g_SLTATR	=	0xfcc9
_g_SLTWRK	=	0xfd09
_g_PROCNM	=	0xfd89
_g_RG08SAV	=	0xffe7
_g_RG09SAV	=	0xffe8
_g_RG10SAV	=	0xffe9
_g_RG11SAV	=	0xffea
_g_RG12SAV	=	0xffeb
_g_RG13SAV	=	0xffec
_g_RG14SAV	=	0xffed
_g_RG15SAV	=	0xffee
_g_RG16SAV	=	0xffef
_g_RG17SAV	=	0xfff0
_g_RG18SAV	=	0xfff1
_g_RG19SAV	=	0xfff2
_g_RG20SAV	=	0xfff3
_g_RG21SAV	=	0xfff4
_g_RG22SAV	=	0xfff5
_g_RG23SAV	=	0xfff6
_g_MINROM	=	0xfff7
_g_SVFFF8	=	0xfff8
_g_RG25SAV	=	0xfffa
_g_RG26SAV	=	0xfffb
_g_RG27SAV	=	0xfffc
_g_SVFFFD	=	0xfffd
_g_CGTABL	=	0x0004
_g_VDP_DR	=	0x0006
_g_VDP_DW	=	0x0007
_g_BASRVN	=	0x002b
_g_ROMVersion	=	0x002b
_g_MSXVER	=	0x002d
_g_MSXMID	=	0x002e
_g_CHAR_16	=	0x0034
_g_SUBRID	=	0x0000
_g_STRSRC	=	0x0002
_g_KANJTABLE	=	0xf30f
_g_DISKVE	=	0xf323
_g_BREAKV	=	0xf325
_g_RAMAD0	=	0xf341
_g_RAMAD1	=	0xf342
_g_RAMAD2	=	0xf343
_g_RAMAD3	=	0xf344
_g_MASTER	=	0xf348
_g_BDOS	=	0xf37d
___str_0:
	.db 0x0a
	.db 0x0d
	.ascii "$"
	.db 0x00
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios.c:82: void BIOS_SetHookCallback(u16 hook, callback cb)
;	---------------------------------
; Function BIOS_SetHookCallback
; ---------------------------------
_BIOS_SetHookCallback::
	ld	c, l
	ld	b, h
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios.c:84: u8 slot = Sys_GetPageSlot((u16)cb >> 14);
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	ld	a, d
	rlca
	rlca
	and	a, #0x03
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	push	de
	ld	a, l
	call	_Sys_GetPageSlot
	pop	de
	pop	bc
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios.c:85: BIOS_SetHookInterSlotCallback(hook, slot, cb);
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios_hook.h:58: *((u8*)hook) = 0xF7; // RST #30
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	ld	(hl), #0xf7
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios_hook.h:59: *((u8*)++hook) = slot; // Slot ID
	inc	bc
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	ld	(hl), a
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios_hook.h:60: *((callback*)++hook) = cb; // Callback address
	inc	bc
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios.c:85: BIOS_SetHookInterSlotCallback(hook, slot, cb);
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios.c:86: }
	ret
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios.c:135: u8 BIOS_InterSlotRead(u8 slot, u16 addr) __NAKED
;	---------------------------------
; Function BIOS_InterSlotRead
; ---------------------------------
_BIOS_InterSlotRead::
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios.c:145: __endasm;
	ex	de, hl
	call	0x000C
	ei
	ret
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios.c:146: }
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios.c:174: void BIOS_InterSlotWrite(u8 slot, u16 addr, u8 value)
;	---------------------------------
; Function BIOS_InterSlotWrite
; ---------------------------------
_BIOS_InterSlotWrite::
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios.c:191: __endasm;
	push	iy
	ld	iy, #4
	add	iy, sp
	ld	l, e
	ld	h, d
	ld	e, 0(iy)
	call	0x0014
	pop	iy
	ei
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios.c:192: }
	pop	hl
	inc	sp
	jp	(hl)
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios.c:211: void BIOS_InterSlotCall(u8 slot, u16 addr)
;	---------------------------------
; Function BIOS_InterSlotCall
; ---------------------------------
_BIOS_InterSlotCall::
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios.c:230: __endasm;
	push	ix
	ld	l, #0
	ld	h, a
	push	hl
	pop	iy
	push	de
	pop	ix
	call	0x001C
	ei
	pop	ix
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios.c:231: }
	ret
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios.c:250: void BIOS_SwitchSlot(u8 page, u8 slot)
;	---------------------------------
; Function BIOS_SwitchSlot
; ---------------------------------
_BIOS_SwitchSlot::
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios.c:262: __endasm;
	rrca	
	rrca 
	and a, #0xC0
	ld	b, h
	ld	h, a
	ld	a, b
	call	0x0024
	ei
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios.c:263: }
	ret
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios.c:343: void BIOS_WriteVDP(u8 reg, u8 value)
;	---------------------------------
; Function BIOS_WriteVDP
; ---------------------------------
_BIOS_WriteVDP::
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios.c:352: __endasm;
	ld	c, a
	ld	b, l
	call	0x0047
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios.c:353: }
	ret
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios.c:374: void BIOS_WriteVRAM(u8 value, u16 addr)
;	---------------------------------
; Function BIOS_WriteVRAM
; ---------------------------------
_BIOS_WriteVRAM::
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios.c:382: __endasm;
	ex	de, hl
	call	0x004D
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios.c:383: }
	ret
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios.c:415: void BIOS_FillVRAM(u16 addr, u16 length, u8 value)
;	---------------------------------
; Function BIOS_FillVRAM
; ---------------------------------
_BIOS_FillVRAM::
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios.c:429: __endasm;
	ld	iy, #2
	add	iy, sp
	ld	c, e
	ld	b, d
	ld	a, 0(iy)
	call	0x0056
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios.c:430: }
	pop	hl
	inc	sp
	jp	(hl)
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios.c:441: void BIOS_CopyFromVRAM(u16 vram, void* ram, u16 length)
;	---------------------------------
; Function BIOS_CopyFromVRAM
; ---------------------------------
_BIOS_CopyFromVRAM::
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios.c:454: __endasm;
	ld	iy, #2
	add	iy, sp
	ld	c, 0(iy)
	ld	b, 1(iy)
	call	0x0059
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios.c:455: }
	pop	hl
	pop	af
	jp	(hl)
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios.c:466: void BIOS_CopyToVRAM(const void* ram, u16 vram, u16 length)
;	---------------------------------
; Function BIOS_CopyToVRAM
; ---------------------------------
_BIOS_CopyToVRAM::
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios.c:479: __endasm;
	ld	iy, #2
	add	iy, sp
	ld	c, 0(iy)
	ld	b, 1(iy)
	call	0x005C
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios.c:480: }
	pop	hl
	pop	af
	jp	(hl)
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios.c:571: void BIOS_InitScreen3Ex(u16 pnt, u16 ct, u16 pgt, u16 sat, u16 sgt, u8 text, u8 bg, u8 border)
;	---------------------------------
; Function BIOS_InitScreen3Ex
; ---------------------------------
_BIOS_InitScreen3Ex::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	(_g_MLTNAM), hl
	ld	(_g_MLTCOL), de
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios.c:575: g_MLTCGP = pgt;    // Address of pattern generator table
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	ld	(_g_MLTCGP), hl
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios.c:576: g_MLTATR = sat;    // Address of sprite attribute table
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	ld	(_g_MLTATR), hl
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios.c:577: g_MLTPAT = sgt;    // Address of sprite generator table
	ld	l, 8 (ix)
	ld	h, 9 (ix)
	ld	(_g_MLTPAT), hl
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios.c:578: g_FORCLR = text;   // Text color
	ld	a, 10 (ix)
	ld	(_g_FORCLR+0), a
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios.c:579: g_BAKCLR = bg;     // Background color
	ld	a, 11 (ix)
	ld	(_g_BAKCLR+0), a
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios.c:580: g_BDRCLR = border; // Border color
	ld	a, 12 (ix)
	ld	(_g_BDRCLR+0), a
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/system.h:231: inline void Call(u16 addr) { ((void(*)(void))addr)(); }
	call	0x0075
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios.c:581: Call(R_INIMLT);
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios.c:582: }
	pop	ix
	pop	hl
	ld	iy, #9
	add	iy, sp
	ld	sp, iy
	jp	(hl)
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios.c:623: u16 BIOS_GetSpritePatternAddress(u8 id) __NAKED
;	---------------------------------
; Function BIOS_GetSpritePatternAddress
; ---------------------------------
_BIOS_GetSpritePatternAddress::
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios.c:631: __endasm;
	call	0x0084
	ex	de, hl
	ret
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios.c:632: }
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios.c:641: u16 BIOS_GetSpriteAttributeAddress(u8 id) __NAKED
;	---------------------------------
; Function BIOS_GetSpriteAttributeAddress
; ---------------------------------
_BIOS_GetSpriteAttributeAddress::
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios.c:649: __endasm;
	call	0x0087
	ex	de, hl
	ret
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios.c:650: }
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios.c:693: void BIOS_WritePSG(u8 reg, u8 value)
;	---------------------------------
; Function BIOS_WritePSG
; ---------------------------------
_BIOS_WritePSG::
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios.c:701: __endasm;	
	ld	e, l
	call	0x0093
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios.c:702: }
	ret
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios.c:719: u8 BIOS_HasCharacter() __NAKED
;	---------------------------------
; Function BIOS_HasCharacter
; ---------------------------------
_BIOS_HasCharacter::
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios.c:727: __endasm;
	ld	l, #0
	call	0x009C
	ret	z
	call	0x009F
	ret
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios.c:728: }
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios.c:829: void BIOS_ClearScreen()
;	---------------------------------
; Function BIOS_ClearScreen
; ---------------------------------
_BIOS_ClearScreen::
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios.c:834: __endasm;
	xor	a, a
	call	0x00C3
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios.c:835: }
	ret
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios.c:844: void BIOS_TextSetCursor(u8 x, u8 y)
;	---------------------------------
; Function BIOS_TextSetCursor
; ---------------------------------
_BIOS_TextSetCursor::
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios.c:852: __endasm;	
	ld	h, a
	call	0x00C6
;/home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA/engine/src/bios.c:853: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
