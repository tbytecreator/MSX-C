;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.0 #15242 (Linux)
;--------------------------------------------------------
	.module main
	
	.optsdcc -mz80 sdcccall(1)
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _init_game
	.globl _Print_At
	.globl _Print_Clear
	.globl _roll_dice
	.globl _VDP_ClearVRAM
	.globl _VDP_SetMode
	.globl _time
	.globl _srand
	.globl _getchar
	.globl _printf
	.globl _running
	.globl _game_state
	.globl _main_menu
	.globl _character_creation
	.globl _exploration
	.globl _handle_exploration_event
	.globl _handle_trap
	.globl _handle_treasure
	.globl _handle_encounter
	.globl _handle_combat
	.globl _show_full_status
	.globl _handle_exit_attempt
	.globl _show_help
	.globl _game_over_screen
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_game_state::
	.ds 29
_running::
	.ds 2
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
;src/main.c:31: void init_game(void) {
;	---------------------------------
; Function init_game
; ---------------------------------
_init_game::
;src/main.c:32: srand((unsigned)time(NULL));
	ld	hl, #0x0000
	call	_time
	ex	de, hl
	call	_srand
;src/main.c:33: VDP_SetMode(VDP_MODE_TEXT1);
	xor	a, a
	call	_VDP_SetMode
;src/main.c:34: VDP_ClearVRAM();
	call	_VDP_ClearVRAM
;src/main.c:35: memset(&game_state, 0, sizeof(Game_State));
	ld	bc, #_game_state+0
	ld	l, c
	ld	h, b
	push	bc
	ld	b, #0x1d
00103$:
	ld	(hl), #0x00
	inc	hl
	djnz	00103$
	pop	bc
;src/main.c:36: game_state.state = GAME_MENU;
	xor	a, a
	ld	(bc), a
;src/main.c:37: game_state.turn = 0;
	ld	hl, #0x0000
	ld	((_game_state + 23)), hl
;src/main.c:38: game_state.player_alive = 1;
	ld	l, #0x01
	ld	((_game_state + 25)), hl
;src/main.c:39: running = 1;
	ld	(_running), hl
;src/main.c:40: }
	ret
;src/main.c:42: void main_menu(void) {
;	---------------------------------
; Function main_menu
; ---------------------------------
_main_menu::
;src/main.c:43: Print_Clear();
	call	_Print_Clear
;src/main.c:44: Print_At(10, 2, "FORTALEZA DE BERDOLOCK");
	ld	hl, #___str_0
	push	hl
	ld	de, #0x0002
	ld	hl, #0x000a
	call	_Print_At
;src/main.c:45: Print_At(8, 4, "Um RPG Solitario em MSX");
	ld	hl, #___str_1
	push	hl
	ld	de, #0x0004
	ld	hl, #0x0008
	call	_Print_At
;src/main.c:46: Print_At(5, 7, "1 - Novo Jogo");
	ld	hl, #___str_2
	push	hl
	ld	de, #0x0007
	ld	hl, #0x0005
	call	_Print_At
;src/main.c:47: Print_At(5, 8, "2 - Continuare");
	ld	hl, #___str_3
	push	hl
	ld	de, #0x0008
	ld	hl, #0x0005
	call	_Print_At
;src/main.c:48: Print_At(5, 9, "3 - Como Jogar");
	ld	hl, #___str_4
	push	hl
	ld	de, #0x0009
	ld	hl, #0x0005
	call	_Print_At
;src/main.c:49: Print_At(5, 10, "4 - Sair");
	ld	hl, #___str_5
	push	hl
	ld	de, #0x000a
	ld	hl, #0x0005
	call	_Print_At
;src/main.c:50: Print_At(5, 13, "Digite sua opcao: ");
	ld	hl, #___str_6
	push	hl
	ld	de, #0x000d
	ld	hl, #0x0005
	call	_Print_At
;src/main.c:52: int choice = getchar();
	call	_getchar
;src/main.c:53: if (choice == '1') game_state.state = GAME_CHARACTER_CREATION;
	ld	a, e
	sub	a, #0x31
	or	a, d
	jr	NZ, 00110$
	ld	hl, #_game_state+0
	ld	(hl), #0x01
	ret
00110$:
;src/main.c:54: else if (choice == '2') game_state.state = GAME_EXPLORATION;
	ld	a, e
	sub	a, #0x32
	or	a, d
	jr	NZ, 00107$
	ld	hl, #_game_state+0
	ld	(hl), #0x02
	ret
00107$:
;src/main.c:55: else if (choice == '3') game_state.state = GAME_HELP;
	ld	a, e
	sub	a, #0x33
	or	a, d
	jr	NZ, 00104$
	ld	hl, #_game_state+0
	ld	(hl), #0x03
	ret
00104$:
;src/main.c:56: else if (choice == '4') running = 0;
	ld	a, e
	sub	a, #0x34
	or	a, d
	ret	NZ
	ld	hl, #0x0000
	ld	(_running), hl
;src/main.c:57: }
	ret
	.area _CODE
	.area _CODE
___str_0:
	.ascii "FORTALEZA DE BERDOLOCK"
	.db 0x00
	.area _CODE
	.area _CODE
___str_1:
	.ascii "Um RPG Solitario em MSX"
	.db 0x00
	.area _CODE
	.area _CODE
___str_2:
	.ascii "1 - Novo Jogo"
	.db 0x00
	.area _CODE
	.area _CODE
___str_3:
	.ascii "2 - Continuare"
	.db 0x00
	.area _CODE
	.area _CODE
___str_4:
	.ascii "3 - Como Jogar"
	.db 0x00
	.area _CODE
	.area _CODE
___str_5:
	.ascii "4 - Sair"
	.db 0x00
	.area _CODE
	.area _CODE
___str_6:
	.ascii "Digite sua opcao: "
	.db 0x00
	.area _CODE
	.area _CODE
;src/main.c:59: void character_creation(void) {
;	---------------------------------
; Function character_creation
; ---------------------------------
_character_creation::
;src/main.c:60: Print_Clear();
	call	_Print_Clear
;src/main.c:61: Print_At(10, 2, "CRIACAO DO PERSONAGEM");
	ld	hl, #___str_7
	push	hl
	ld	de, #0x0002
	ld	hl, #0x000a
	call	_Print_At
;src/main.c:62: Print_At(2, 6, "Seu personagem comecara com:");
	ld	hl, #___str_8
	push	hl
	ld	de, #0x0006
	ld	hl, #0x0002
	call	_Print_At
;src/main.c:63: Print_At(5, 8, "PA (Poder de Ataque): 2d6");
	ld	hl, #___str_9
	push	hl
	ld	de, #0x0008
	ld	hl, #0x0005
	call	_Print_At
;src/main.c:64: Print_At(5, 9, "PD (Poder de Defesa): 7");
	ld	hl, #___str_10
	push	hl
	ld	de, #0x0009
	ld	hl, #0x0005
	call	_Print_At
;src/main.c:65: Print_At(5, 10, "PV (Pontos Vitais): 2d6");
	ld	hl, #___str_11
	push	hl
	ld	de, #0x000a
	ld	hl, #0x0005
	call	_Print_At
;src/main.c:67: game_state.player.pa = roll_dice(1, 6) + roll_dice(1, 6);
	ld	de, #0x0006
	ld	hl, #0x0001
	call	_roll_dice
	push	de
	ld	de, #0x0006
	ld	hl, #0x0001
	call	_roll_dice
	pop	hl
	add	hl, de
	ld	((_game_state + 1)), hl
;src/main.c:68: game_state.player.pd = 7;
	ld	hl, #0x0007
	ld	((_game_state + 3)), hl
;src/main.c:69: game_state.player.pv_max = roll_dice(1, 6) + roll_dice(1, 6);
	ld	de, #0x0006
	ld	l, #0x01
	call	_roll_dice
	push	de
	ld	de, #0x0006
	ld	hl, #0x0001
	call	_roll_dice
	pop	hl
	add	hl, de
	ld	((_game_state + 7)), hl
;src/main.c:70: game_state.player.pv = game_state.player.pv_max;
	ld	((_game_state + 5)), hl
;src/main.c:71: game_state.player.weapon = WEAPON_SWORD;
	ld	hl, #_game_state + 9
	ld	(hl), #0x01
;src/main.c:72: game_state.player.armor = ARMOR_PLATE;
	ld	hl, #_game_state + 10
	ld	(hl), #0x01
;src/main.c:73: game_state.player.shield = 1;
	ld	hl, #0x0001
	ld	((_game_state + 11)), hl
;src/main.c:74: game_state.player.potions = 0;
	ld	l, h
	ld	((_game_state + 13)), hl
;src/main.c:75: game_state.player.trap_ring = 0;
	ld	((_game_state + 15)), hl
;src/main.c:76: game_state.player.magic_sword = 0;
	ld	((_game_state + 17)), hl
;src/main.c:77: game_state.player.magic_armor = 0;
	ld	((_game_state + 19)), hl
;src/main.c:78: game_state.player.gold = 0;
	ld	((_game_state + 21)), hl
;src/main.c:80: Print_At(5, 12, "PA rolado: ");
	ld	hl, #___str_12
	push	hl
	ld	de, #0x000c
	ld	hl, #0x0005
	call	_Print_At
;src/main.c:81: printf("%d", game_state.player.pa);
	ld	bc, (#(_game_state + 1) + 0)
	push	bc
	ld	hl, #___str_13
	push	hl
	call	_printf
	pop	af
;src/main.c:82: Print_At(5, 13, "PV rolado: ");
	ld	hl, #___str_14
	ex	(sp),hl
	ld	de, #0x000d
	ld	hl, #0x0005
	call	_Print_At
;src/main.c:83: printf("%d", game_state.player.pv_max);
	ld	hl, (#(_game_state + 7) + 0)
	push	hl
	ld	hl, #___str_13
	push	hl
	call	_printf
	pop	af
;src/main.c:84: Print_At(5, 15, "Pressione ENTER para continuar...");
	ld	hl, #___str_15
	ex	(sp),hl
	ld	de, #0x000f
	ld	hl, #0x0005
	call	_Print_At
;src/main.c:86: getchar();
	call	_getchar
;src/main.c:87: game_state.state = GAME_EXPLORATION;
	ld	hl, #_game_state
	ld	(hl), #0x02
;src/main.c:88: game_state.turn = 1;
	ld	hl, #0x0001
	ld	((_game_state + 23)), hl
;src/main.c:89: game_state.player_alive = 1;
	ld	((_game_state + 25)), hl
;src/main.c:90: }
	ret
	.area _CODE
	.area _CODE
___str_7:
	.ascii "CRIACAO DO PERSONAGEM"
	.db 0x00
	.area _CODE
	.area _CODE
___str_8:
	.ascii "Seu personagem comecara com:"
	.db 0x00
	.area _CODE
	.area _CODE
___str_9:
	.ascii "PA (Poder de Ataque): 2d6"
	.db 0x00
	.area _CODE
	.area _CODE
___str_10:
	.ascii "PD (Poder de Defesa): 7"
	.db 0x00
	.area _CODE
	.area _CODE
___str_11:
	.ascii "PV (Pontos Vitais): 2d6"
	.db 0x00
	.area _CODE
	.area _CODE
___str_12:
	.ascii "PA rolado: "
	.db 0x00
	.area _CODE
	.area _CODE
___str_13:
	.ascii "%d"
	.db 0x00
	.area _CODE
	.area _CODE
___str_14:
	.ascii "PV rolado: "
	.db 0x00
	.area _CODE
	.area _CODE
___str_15:
	.ascii "Pressione ENTER para continuar..."
	.db 0x00
	.area _CODE
	.area _CODE
;src/main.c:92: void exploration(void) {
;	---------------------------------
; Function exploration
; ---------------------------------
_exploration::
;src/main.c:93: Print_Clear();
	call	_Print_Clear
;src/main.c:94: Print_At(5, 1, "=== FORTALEZA DE BERDOLOCK ===");
	ld	hl, #___str_16
	push	hl
	ld	de, #0x0001
	ld	hl, #0x0005
	call	_Print_At
;src/main.c:95: Print_At(2, 3, "Turno: ");
	ld	hl, #___str_17
	push	hl
	ld	de, #0x0003
	ld	hl, #0x0002
	call	_Print_At
;src/main.c:96: printf("%d/30", game_state.turn);
	ld	hl, (#(_game_state + 23) + 0)
	ld	bc, #___str_18+0
	push	hl
	push	bc
	call	_printf
	pop	af
;src/main.c:98: Print_At(5, 6, "PA: ");
	ld	hl, #___str_19
	ex	(sp),hl
	ld	de, #0x0006
	ld	hl, #0x0005
	call	_Print_At
;src/main.c:99: printf("%d", game_state.player.pa);
	ld	bc, (#_game_state + 1)
	push	bc
	ld	hl, #___str_20
	push	hl
	call	_printf
	pop	af
;src/main.c:100: Print_At(20, 6, "PD: ");
	ld	hl, #___str_21
	ex	(sp),hl
	ld	de, #0x0006
	ld	hl, #0x0014
	call	_Print_At
;src/main.c:101: printf("%d", game_state.player.pd);
	ld	hl, (#_game_state + 3)
	push	hl
	ld	hl, #___str_20
	push	hl
	call	_printf
	pop	af
;src/main.c:102: Print_At(5, 7, "PV: ");
	ld	hl, #___str_22
	ex	(sp),hl
	ld	de, #0x0007
	ld	hl, #0x0005
	call	_Print_At
;src/main.c:103: printf("%d/%d", game_state.player.pv, game_state.player.pv_max);
	ld	de, (#(_game_state + 7) + 0)
	ld	hl, (#(_game_state + 5) + 0)
	ld	bc, #___str_23+0
	push	de
	push	hl
	push	bc
	call	_printf
	pop	af
	pop	af
;src/main.c:104: Print_At(5, 10, "Pocoes: ");
	ld	hl, #___str_24
	ex	(sp),hl
	ld	de, #0x000a
	ld	hl, #0x0005
	call	_Print_At
;src/main.c:105: printf("%d", game_state.player.potions);
	ld	hl, (#(_game_state + 13) + 0)
	push	hl
	ld	hl, #___str_20
	push	hl
	call	_printf
	pop	af
;src/main.c:106: Print_At(5, 11, "Ouro: ");
	ld	hl, #___str_25
	ex	(sp),hl
	ld	de, #0x000b
	ld	hl, #0x0005
	call	_Print_At
;src/main.c:107: printf("%d", game_state.player.gold);
	ld	hl, (#_game_state + 21)
	push	hl
	ld	hl, #___str_20
	push	hl
	call	_printf
	pop	af
;src/main.c:109: Print_At(2, 14, "Acoes:");
	ld	hl, #___str_26
	ex	(sp),hl
	ld	de, #0x000e
	ld	hl, #0x0002
	call	_Print_At
;src/main.c:110: Print_At(5, 15, "1 - Explorar");
	ld	hl, #___str_27
	push	hl
	ld	de, #0x000f
	ld	hl, #0x0005
	call	_Print_At
;src/main.c:111: Print_At(5, 16, "2 - Usar Pocao");
	ld	hl, #___str_28
	push	hl
	ld	de, #0x0010
	ld	hl, #0x0005
	call	_Print_At
;src/main.c:112: Print_At(5, 17, "3 - Status");
	ld	hl, #___str_29
	push	hl
	ld	de, #0x0011
	ld	hl, #0x0005
	call	_Print_At
;src/main.c:113: Print_At(5, 18, "4 - Menu");
	ld	hl, #___str_30
	push	hl
	ld	de, #0x0012
	ld	hl, #0x0005
	call	_Print_At
;src/main.c:115: Print_At(2, 22, "Escolha: ");
	ld	hl, #___str_31
	push	hl
	ld	de, #0x0016
	ld	hl, #0x0002
	call	_Print_At
;src/main.c:117: int choice = getchar();
	call	_getchar
;src/main.c:119: if (choice == '1') {
	ld	a, e
	sub	a, #0x31
	or	a, d
	jr	NZ, 00114$
;src/main.c:120: handle_exploration_event();
	call	_handle_exploration_event
;src/main.c:121: game_state.turn++;
	ld	hl, (#(_game_state + 23) + 0)
	inc	hl
	ld	((_game_state + 23)), hl
;src/main.c:122: if (game_state.turn > 30) game_state.turn = 30;
	ld	a, #0x1e
	cp	a, l
	ld	a, #0x00
	sbc	a, h
	jp	PO, 00162$
	xor	a, #0x80
00162$:
	ret	P
	ld	hl, #0x001e
	ld	((_game_state + 23)), hl
	ret
00114$:
;src/main.c:123: } else if (choice == '2') {
	ld	a, e
	sub	a, #0x32
	or	a, d
	jr	NZ, 00111$
;src/main.c:124: if (game_state.player.potions > 0) {
	ld	hl, (#(_game_state + 13) + 0)
	xor	a, a
	cp	a, l
	sbc	a, h
	jp	PO, 00165$
	xor	a, #0x80
00165$:
	jp	P, _getchar
;src/main.c:125: game_state.player.pv = game_state.player.pv_max;
	ld	hl, (#(_game_state + 7) + 0)
	ld	((_game_state + 5)), hl
;src/main.c:126: game_state.player.potions--;
	ld	hl, (#(_game_state + 13) + 0)
	dec	hl
;src/main.c:128: getchar();
	ld	((_game_state + 13)), hl
	jp	_getchar
00111$:
;src/main.c:129: } else if (choice == '3') {
	ld	a, e
	sub	a, #0x33
	or	a, d
	jp	Z, _show_full_status
;src/main.c:130: show_full_status();
;src/main.c:131: } else if (choice == '4') {
	ld	a, e
	sub	a, #0x34
	or	a, d
	ret	NZ
;src/main.c:132: game_state.state = GAME_MENU;
	ld	hl, #_game_state
	ld	(hl), #0x00
;src/main.c:134: }
	ret
	.area _CODE
	.area _CODE
___str_16:
	.ascii "=== FORTALEZA DE BERDOLOCK ==="
	.db 0x00
	.area _CODE
	.area _CODE
___str_17:
	.ascii "Turno: "
	.db 0x00
	.area _CODE
	.area _CODE
___str_18:
	.ascii "%d/30"
	.db 0x00
	.area _CODE
	.area _CODE
___str_19:
	.ascii "PA: "
	.db 0x00
	.area _CODE
	.area _CODE
___str_20:
	.ascii "%d"
	.db 0x00
	.area _CODE
	.area _CODE
___str_21:
	.ascii "PD: "
	.db 0x00
	.area _CODE
	.area _CODE
___str_22:
	.ascii "PV: "
	.db 0x00
	.area _CODE
	.area _CODE
___str_23:
	.ascii "%d/%d"
	.db 0x00
	.area _CODE
	.area _CODE
___str_24:
	.ascii "Pocoes: "
	.db 0x00
	.area _CODE
	.area _CODE
___str_25:
	.ascii "Ouro: "
	.db 0x00
	.area _CODE
	.area _CODE
___str_26:
	.ascii "Acoes:"
	.db 0x00
	.area _CODE
	.area _CODE
___str_27:
	.ascii "1 - Explorar"
	.db 0x00
	.area _CODE
	.area _CODE
___str_28:
	.ascii "2 - Usar Pocao"
	.db 0x00
	.area _CODE
	.area _CODE
___str_29:
	.ascii "3 - Status"
	.db 0x00
	.area _CODE
	.area _CODE
___str_30:
	.ascii "4 - Menu"
	.db 0x00
	.area _CODE
	.area _CODE
___str_31:
	.ascii "Escolha: "
	.db 0x00
	.area _CODE
	.area _CODE
;src/main.c:136: void handle_exploration_event(void) {
;	---------------------------------
; Function handle_exploration_event
; ---------------------------------
_handle_exploration_event::
;src/main.c:137: int roll = roll_dice(2, 6);
	ld	de, #0x0006
	ld	hl, #0x0002
	call	_roll_dice
;src/main.c:139: Print_Clear();
	push	de
	call	_Print_Clear
;src/main.c:140: Print_At(10, 2, "=== EVENTO ===");
	ld	hl, #___str_32
	push	hl
	ld	de, #0x0002
	ld	hl, #0x000a
	call	_Print_At
;src/main.c:141: Print_At(2, 4, "Voce rolou: ");
	ld	hl, #___str_33
	push	hl
	ld	de, #0x0004
	ld	hl, #0x0002
	call	_Print_At
	pop	de
;src/main.c:142: printf("%d", roll);
	push	de
	push	de
	ld	hl, #___str_34
	push	hl
	call	_printf
	pop	af
	pop	af
	pop	de
;src/main.c:144: if (roll == 3) handle_trap();
	ld	a, e
	sub	a, #0x03
	or	a, d
	jr	NZ, 00110$
	call	_handle_trap
	jr	00111$
00110$:
;src/main.c:145: else if (roll == 4 || roll == 12) handle_treasure();
	ld	a, e
	sub	a, #0x04
	or	a, d
	jr	Z, 00105$
	ld	a, e
	sub	a, #0x0c
	or	a, d
	jr	NZ, 00106$
00105$:
	call	_handle_treasure
	jr	00111$
00106$:
;src/main.c:146: else if (roll == 7 || roll == 11) handle_encounter();
	ld	a, e
	sub	a, #0x07
	or	a, d
	jr	Z, 00101$
	ld	a, e
	sub	a, #0x0b
	or	a, d
	jr	NZ, 00102$
00101$:
	call	_handle_encounter
	jr	00111$
00102$:
;src/main.c:147: else Print_At(2, 6, "Voce encontrou uma secao.");
	ld	hl, #___str_35
	push	hl
	ld	de, #0x0006
	ld	hl, #0x0002
	call	_Print_At
00111$:
;src/main.c:149: Print_At(2, 22, "Pressione ENTER...");
	ld	hl, #___str_36
	push	hl
	ld	de, #0x0016
	ld	hl, #0x0002
	call	_Print_At
;src/main.c:150: getchar();
;src/main.c:151: }
	jp	_getchar
	.area _CODE
	.area _CODE
___str_32:
	.ascii "=== EVENTO ==="
	.db 0x00
	.area _CODE
	.area _CODE
___str_33:
	.ascii "Voce rolou: "
	.db 0x00
	.area _CODE
	.area _CODE
___str_34:
	.ascii "%d"
	.db 0x00
	.area _CODE
	.area _CODE
___str_35:
	.ascii "Voce encontrou uma secao."
	.db 0x00
	.area _CODE
	.area _CODE
___str_36:
	.ascii "Pressione ENTER..."
	.db 0x00
	.area _CODE
	.area _CODE
;src/main.c:153: void handle_trap(void) {
;	---------------------------------
; Function handle_trap
; ---------------------------------
_handle_trap::
;src/main.c:154: int trap_type = roll_dice(1, 6);
	ld	de, #0x0006
	ld	hl, #0x0001
	call	_roll_dice
;src/main.c:155: int damage = roll_dice(1, 6);
	push	de
	ld	de, #0x0006
	ld	hl, #0x0001
	call	_roll_dice
;src/main.c:157: Print_At(2, 6, "Armadilha tipo: ");
	ld	bc, #___str_37+0
	push	de
	push	bc
	ld	de, #0x0006
	ld	hl, #0x0002
	call	_Print_At
	pop	de
	pop	hl
;src/main.c:158: printf("%d", trap_type);
	ld	bc, #___str_38+0
	push	hl
	push	de
	push	hl
	push	bc
	call	_printf
	pop	af
	pop	af
	pop	de
	pop	hl
;src/main.c:160: if (trap_type == 6) {
	ld	a, l
	sub	a, #0x06
	or	a, h
	jr	NZ, 00104$
;src/main.c:161: game_state.player.pv = 0;
	ld	hl, #0x0000
	ld	((_game_state + 5)), hl
;src/main.c:162: game_state.player_alive = 0;
	ld	((_game_state + 25)), hl
;src/main.c:163: game_state.state = GAME_OVER;
	ld	hl, #_game_state
	ld	(hl), #0x04
	ret
00104$:
;src/main.c:165: game_state.player.pv -= damage;
	ld	hl, (#(_game_state + 5) + 0)
	cp	a, a
	sbc	hl, de
	ld	((_game_state + 5)), hl
;src/main.c:166: if (game_state.player.pv <= 0) {
	xor	a, a
	cp	a, l
	sbc	a, h
	jp	PO, 00124$
	xor	a, #0x80
00124$:
	ret	M
;src/main.c:167: game_state.player.pv = 0;
	ld	hl, #0x0000
	ld	((_game_state + 5)), hl
;src/main.c:168: game_state.player_alive = 0;
	ld	((_game_state + 25)), hl
;src/main.c:169: game_state.state = GAME_OVER;
	ld	hl, #_game_state
	ld	(hl), #0x04
;src/main.c:172: }
	ret
	.area _CODE
	.area _CODE
___str_37:
	.ascii "Armadilha tipo: "
	.db 0x00
	.area _CODE
	.area _CODE
___str_38:
	.ascii "%d"
	.db 0x00
	.area _CODE
	.area _CODE
;src/main.c:174: void handle_treasure(void) {
;	---------------------------------
; Function handle_treasure
; ---------------------------------
_handle_treasure::
;src/main.c:175: int treasure_type = roll_dice(1, 6);
	ld	de, #0x0006
	ld	hl, #0x0001
	call	_roll_dice
;src/main.c:177: Print_At(2, 8, "Tesouro: ");
	push	de
	ld	hl, #___str_39
	push	hl
	ld	de, #0x0008
	ld	hl, #0x0002
	call	_Print_At
	pop	de
;src/main.c:178: printf("%d", treasure_type);
	push	de
	push	de
	ld	hl, #___str_40
	push	hl
	call	_printf
	pop	af
	pop	af
	pop	de
;src/main.c:180: if (treasure_type == 2) game_state.player.potions++;
	ld	a, e
	sub	a, #0x02
	or	a, d
	jr	NZ, 00104$
	ld	hl, (#(_game_state + 13) + 0)
	inc	hl
	ld	((_game_state + 13)), hl
	ret
00104$:
;src/main.c:181: else if (treasure_type == 5) game_state.player.gold += roll_dice(1, 6) * 1000;
	ld	a, e
	sub	a, #0x05
	or	a, d
	ret	NZ
	ld	bc, (#(_game_state + 21) + 0)
	push	bc
	ld	de, #0x0006
	ld	hl, #0x0001
	call	_roll_dice
	pop	bc
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	((_game_state + 21)), hl
;src/main.c:182: }
	ret
	.area _CODE
	.area _CODE
___str_39:
	.ascii "Tesouro: "
	.db 0x00
	.area _CODE
	.area _CODE
___str_40:
	.ascii "%d"
	.db 0x00
	.area _CODE
	.area _CODE
;src/main.c:184: void handle_encounter(void) {
;	---------------------------------
; Function handle_encounter
; ---------------------------------
_handle_encounter::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-8
	add	hl, sp
	ld	sp, hl
;src/main.c:185: int enemy_type = roll_dice(1, 6);
	ld	de, #0x0006
	ld	hl, #0x0001
	call	_roll_dice
;src/main.c:188: Print_At(2, 8, "Inimigo tipo: ");
	push	de
	ld	hl, #___str_41
	push	hl
	ld	de, #0x0008
	ld	hl, #0x0002
	call	_Print_At
	pop	de
;src/main.c:189: printf("%d", enemy_type);
	push	de
	push	de
	ld	hl, #___str_42
	push	hl
	call	_printf
	pop	af
	pop	af
	pop	de
;src/main.c:191: enemy.type = enemy_type;
	ld	hl, #0
	add	hl, sp
	ld	(hl), e
	inc	hl
	ld	(hl), d
	dec	hl
;src/main.c:192: enemy.pa = 2;
	ld	-6 (ix), #0x02
	ld	-5 (ix), #0
;src/main.c:193: enemy.pd = 7;
	ld	-4 (ix), #0x07
	xor	a, a
	ld	-3 (ix), a
;src/main.c:194: enemy.pv = 10;
	ld	-2 (ix), #0x0a
	ld	-1 (ix), #0
;src/main.c:196: handle_combat(&enemy);
	call	_handle_combat
;src/main.c:197: }
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _CODE
___str_41:
	.ascii "Inimigo tipo: "
	.db 0x00
	.area _CODE
	.area _CODE
___str_42:
	.ascii "%d"
	.db 0x00
	.area _CODE
	.area _CODE
;src/main.c:199: void handle_combat(Enemy_t* enemy) {
;	---------------------------------
; Function handle_combat
; ---------------------------------
_handle_combat::
;src/main.c:200: Print_Clear();
	push	hl
	call	_Print_Clear
;src/main.c:201: Print_At(5, 2, "=== COMBATE ===");
	ld	hl, #___str_43
	push	hl
	ld	de, #0x0002
	ld	hl, #0x0005
	call	_Print_At
;src/main.c:202: Print_At(2, 5, "Jogador: ");
	ld	hl, #___str_44
	push	hl
	ld	de, #0x0005
	ld	hl, #0x0002
	call	_Print_At
;src/main.c:203: printf("%d PV", game_state.player.pv);
	ld	bc, (#(_game_state + 5) + 0)
	push	bc
	ld	hl, #___str_45
	push	hl
	call	_printf
	pop	af
;src/main.c:204: Print_At(2, 6, "Inimigo: ");
	ld	hl, #___str_46
	ex	(sp),hl
	ld	de, #0x0006
	ld	hl, #0x0002
	call	_Print_At
	pop	de
;src/main.c:205: printf("%d PV", enemy->pv);
	ld	hl, #6
	add	hl, de
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	ld	hl, #___str_45
	push	hl
	call	_printf
	pop	af
;src/main.c:206: Print_At(2, 22, "Pressione ENTER...");
	ld	hl, #___str_47
	ex	(sp),hl
	ld	de, #0x0016
	ld	hl, #0x0002
	call	_Print_At
;src/main.c:207: getchar();
;src/main.c:208: }
	jp	_getchar
	.area _CODE
	.area _CODE
___str_43:
	.ascii "=== COMBATE ==="
	.db 0x00
	.area _CODE
	.area _CODE
___str_44:
	.ascii "Jogador: "
	.db 0x00
	.area _CODE
	.area _CODE
___str_45:
	.ascii "%d PV"
	.db 0x00
	.area _CODE
	.area _CODE
___str_46:
	.ascii "Inimigo: "
	.db 0x00
	.area _CODE
	.area _CODE
___str_47:
	.ascii "Pressione ENTER..."
	.db 0x00
	.area _CODE
	.area _CODE
;src/main.c:210: void show_full_status(void) {
;	---------------------------------
; Function show_full_status
; ---------------------------------
_show_full_status::
;src/main.c:211: Print_Clear();
	call	_Print_Clear
;src/main.c:212: Print_At(8, 2, "=== STATUS ===");
	ld	hl, #___str_48
	push	hl
	ld	de, #0x0002
	ld	hl, #0x0008
	call	_Print_At
;src/main.c:213: Print_At(2, 4, "PA: ");
	ld	hl, #___str_49
	push	hl
	ld	de, #0x0004
	ld	hl, #0x0002
	call	_Print_At
;src/main.c:214: printf("%d", game_state.player.pa);
	ld	bc, (#_game_state + 1)
	push	bc
	ld	hl, #___str_50
	push	hl
	call	_printf
	pop	af
;src/main.c:215: Print_At(2, 5, "PD: ");
	ld	hl, #___str_51
	ex	(sp),hl
	ld	de, #0x0005
	ld	hl, #0x0002
	call	_Print_At
;src/main.c:216: printf("%d", game_state.player.pd);
	ld	hl, (#_game_state + 3)
	push	hl
	ld	hl, #___str_50
	push	hl
	call	_printf
	pop	af
;src/main.c:217: Print_At(2, 6, "PV: ");
	ld	hl, #___str_52
	ex	(sp),hl
	ld	de, #0x0006
	ld	hl, #0x0002
	call	_Print_At
;src/main.c:218: printf("%d/%d", game_state.player.pv, game_state.player.pv_max);
	ld	de, (#_game_state + 7)
	ld	hl, (#_game_state + 5)
	ld	bc, #___str_53+0
	push	de
	push	hl
	push	bc
	call	_printf
	pop	af
	pop	af
;src/main.c:219: Print_At(2, 22, "Pressione ENTER...");
	ld	hl, #___str_54
	ex	(sp),hl
	ld	de, #0x0016
	ld	hl, #0x0002
	call	_Print_At
;src/main.c:220: getchar();
;src/main.c:221: }
	jp	_getchar
	.area _CODE
	.area _CODE
___str_48:
	.ascii "=== STATUS ==="
	.db 0x00
	.area _CODE
	.area _CODE
___str_49:
	.ascii "PA: "
	.db 0x00
	.area _CODE
	.area _CODE
___str_50:
	.ascii "%d"
	.db 0x00
	.area _CODE
	.area _CODE
___str_51:
	.ascii "PD: "
	.db 0x00
	.area _CODE
	.area _CODE
___str_52:
	.ascii "PV: "
	.db 0x00
	.area _CODE
	.area _CODE
___str_53:
	.ascii "%d/%d"
	.db 0x00
	.area _CODE
	.area _CODE
___str_54:
	.ascii "Pressione ENTER..."
	.db 0x00
	.area _CODE
	.area _CODE
;src/main.c:223: void handle_exit_attempt(void) {
;	---------------------------------
; Function handle_exit_attempt
; ---------------------------------
_handle_exit_attempt::
;src/main.c:224: Print_Clear();
	call	_Print_Clear
;src/main.c:225: Print_At(5, 2, "=== SAIDA ===");
	ld	hl, #___str_55
	push	hl
	ld	de, #0x0002
	ld	hl, #0x0005
	call	_Print_At
;src/main.c:226: Print_At(2, 6, "Voce escapou!");
	ld	hl, #___str_56
	push	hl
	ld	de, #0x0006
	ld	hl, #0x0002
	call	_Print_At
;src/main.c:227: game_state.state = GAME_OVER;
	ld	hl, #_game_state+0
	ld	(hl), #0x04
;src/main.c:228: }
	ret
	.area _CODE
	.area _CODE
___str_55:
	.ascii "=== SAIDA ==="
	.db 0x00
	.area _CODE
	.area _CODE
___str_56:
	.ascii "Voce escapou!"
	.db 0x00
	.area _CODE
	.area _CODE
;src/main.c:230: void show_help(void) {
;	---------------------------------
; Function show_help
; ---------------------------------
_show_help::
;src/main.c:231: Print_Clear();
	call	_Print_Clear
;src/main.c:232: Print_At(8, 2, "=== COMO JOGAR ===");
	ld	hl, #___str_57
	push	hl
	ld	de, #0x0002
	ld	hl, #0x0008
	call	_Print_At
;src/main.c:233: Print_At(2, 5, "Explore a masmorra");
	ld	hl, #___str_58
	push	hl
	ld	de, #0x0005
	ld	hl, #0x0002
	call	_Print_At
;src/main.c:234: Print_At(2, 6, "Derrote inimigos");
	ld	hl, #___str_59
	push	hl
	ld	de, #0x0006
	ld	hl, #0x0002
	call	_Print_At
;src/main.c:235: Print_At(2, 7, "Colete tesouros");
	ld	hl, #___str_60
	push	hl
	ld	de, #0x0007
	ld	hl, #0x0002
	call	_Print_At
;src/main.c:236: Print_At(2, 8, "Escape em 30 turnos!");
	ld	hl, #___str_61
	push	hl
	ld	de, #0x0008
	ld	hl, #0x0002
	call	_Print_At
;src/main.c:237: Print_At(2, 22, "Pressione ENTER...");
	ld	hl, #___str_62
	push	hl
	ld	de, #0x0016
	ld	hl, #0x0002
	call	_Print_At
;src/main.c:238: getchar();
	call	_getchar
;src/main.c:239: game_state.state = GAME_MENU;
	ld	hl, #_game_state+0
	ld	(hl), #0x00
;src/main.c:240: }
	ret
	.area _CODE
	.area _CODE
___str_57:
	.ascii "=== COMO JOGAR ==="
	.db 0x00
	.area _CODE
	.area _CODE
___str_58:
	.ascii "Explore a masmorra"
	.db 0x00
	.area _CODE
	.area _CODE
___str_59:
	.ascii "Derrote inimigos"
	.db 0x00
	.area _CODE
	.area _CODE
___str_60:
	.ascii "Colete tesouros"
	.db 0x00
	.area _CODE
	.area _CODE
___str_61:
	.ascii "Escape em 30 turnos!"
	.db 0x00
	.area _CODE
	.area _CODE
___str_62:
	.ascii "Pressione ENTER..."
	.db 0x00
	.area _CODE
	.area _CODE
;src/main.c:242: void game_over_screen(void) {
;	---------------------------------
; Function game_over_screen
; ---------------------------------
_game_over_screen::
;src/main.c:243: Print_Clear();
	call	_Print_Clear
;src/main.c:245: if (game_state.player_alive) {
	ld	hl, (#_game_state + 25)
	ld	a, h
	or	a, l
	jr	Z, 00102$
;src/main.c:246: Print_At(10, 5, "=== VOCE VENCEU ===");
	ld	hl, #___str_63
	push	hl
	ld	de, #0x0005
	ld	hl, #0x000a
	call	_Print_At
	jr	00103$
00102$:
;src/main.c:248: Print_At(10, 5, "=== GAME OVER ===");
	ld	hl, #___str_64
	push	hl
	ld	de, #0x0005
	ld	hl, #0x000a
	call	_Print_At
00103$:
;src/main.c:251: Print_At(5, 9, "Turnos: ");
	ld	hl, #___str_65
	push	hl
	ld	de, #0x0009
	ld	hl, #0x0005
	call	_Print_At
;src/main.c:252: printf("%d/30", game_state.turn);
	ld	hl, (#_game_state + 23)
	ld	bc, #___str_66+0
	push	hl
	push	bc
	call	_printf
	pop	af
;src/main.c:253: Print_At(5, 10, "Ouro: ");
	ld	hl, #___str_67
	ex	(sp),hl
	ld	de, #0x000a
	ld	hl, #0x0005
	call	_Print_At
;src/main.c:254: printf("%d", game_state.player.gold);
	ld	hl, (#_game_state + 21)
	ld	bc, #___str_68+0
	push	hl
	push	bc
	call	_printf
	pop	af
;src/main.c:256: Print_At(2, 16, "1 - Novo Jogo");
	ld	hl, #___str_69
	ex	(sp),hl
	ld	de, #0x0010
	ld	hl, #0x0002
	call	_Print_At
;src/main.c:257: Print_At(2, 17, "2 - Menu");
	ld	hl, #___str_70
	push	hl
	ld	de, #0x0011
	ld	hl, #0x0002
	call	_Print_At
;src/main.c:258: Print_At(2, 18, "3 - Sair");
	ld	hl, #___str_71
	push	hl
	ld	de, #0x0012
	ld	hl, #0x0002
	call	_Print_At
;src/main.c:260: int choice = getchar();
	call	_getchar
;src/main.c:261: if (choice == '1') game_state.state = GAME_CHARACTER_CREATION;
	ld	hl, #_game_state
	ld	a, e
	sub	a, #0x31
	or	a, d
	jr	NZ, 00110$
	ld	(hl), #0x01
	ret
00110$:
;src/main.c:262: else if (choice == '2') game_state.state = GAME_MENU;
	ld	a, e
	sub	a, #0x32
	or	a, d
	jr	NZ, 00107$
	ld	(hl), a
	ret
00107$:
;src/main.c:263: else if (choice == '3') running = 0;
	ld	a, e
	sub	a, #0x33
	or	a, d
	ret	NZ
	ld	hl, #0x0000
	ld	(_running), hl
;src/main.c:264: }
	ret
	.area _CODE
	.area _CODE
___str_63:
	.ascii "=== VOCE VENCEU ==="
	.db 0x00
	.area _CODE
	.area _CODE
___str_64:
	.ascii "=== GAME OVER ==="
	.db 0x00
	.area _CODE
	.area _CODE
___str_65:
	.ascii "Turnos: "
	.db 0x00
	.area _CODE
	.area _CODE
___str_66:
	.ascii "%d/30"
	.db 0x00
	.area _CODE
	.area _CODE
___str_67:
	.ascii "Ouro: "
	.db 0x00
	.area _CODE
	.area _CODE
___str_68:
	.ascii "%d"
	.db 0x00
	.area _CODE
	.area _CODE
___str_69:
	.ascii "1 - Novo Jogo"
	.db 0x00
	.area _CODE
	.area _CODE
___str_70:
	.ascii "2 - Menu"
	.db 0x00
	.area _CODE
	.area _CODE
___str_71:
	.ascii "3 - Sair"
	.db 0x00
	.area _CODE
	.area _CODE
;src/main.c:266: int main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:267: init_game();
	call	_init_game
;src/main.c:269: while (running) {
00108$:
	ld	a, (_running+1)
	ld	iy, #_running
	or	a, 0 (iy)
	jr	Z, 00110$
;src/main.c:270: switch (game_state.state) {
	ld	hl, #_game_state
	ld	c, (hl)
	ld	a, #0x04
	sub	a, c
	jr	C, 00106$
	ld	b, #0x00
	ld	hl, #00134$
	add	hl, bc
	add	hl, bc
	ld	c, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, c
	jp	(hl)
00134$:
	.dw	00101$
	.dw	00102$
	.dw	00103$
	.dw	00104$
	.dw	00105$
;src/main.c:271: case GAME_MENU:
00101$:
;src/main.c:272: main_menu();
	call	_main_menu
;src/main.c:273: break;
	jr	00108$
;src/main.c:274: case GAME_CHARACTER_CREATION:
00102$:
;src/main.c:275: character_creation();
	call	_character_creation
;src/main.c:276: break;
	jr	00108$
;src/main.c:277: case GAME_EXPLORATION:
00103$:
;src/main.c:278: exploration();
	call	_exploration
;src/main.c:279: break;
	jr	00108$
;src/main.c:280: case GAME_HELP:
00104$:
;src/main.c:281: show_help();
	call	_show_help
;src/main.c:282: break;
	jr	00108$
;src/main.c:283: case GAME_OVER:
00105$:
;src/main.c:284: game_over_screen();
	call	_game_over_screen
;src/main.c:285: break;
	jr	00108$
;src/main.c:286: default:
00106$:
;src/main.c:287: game_state.state = GAME_MENU;
	ld	(hl), #0x00
;src/main.c:289: }
	jr	00108$
00110$:
;src/main.c:292: Print_Clear();
	call	_Print_Clear
;src/main.c:293: Print_At(8, 12, "Obrigado por jogar!");
	ld	hl, #___str_72
	push	hl
	ld	de, #0x000c
	ld	hl, #0x0008
	call	_Print_At
;src/main.c:295: return 0;
	ld	de, #0x0000
;src/main.c:296: }
	ret
	.area _CODE
	.area _CODE
___str_72:
	.ascii "Obrigado por jogar!"
	.db 0x00
	.area _CODE
	.area _CODE
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
