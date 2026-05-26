#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include "msxgl.h"
#include "game.h"
#include "ui.h"

// ============================================================================
// FORTALEZA DE BERDOLOCK - MSX Adventure Game
// Simplified version for SDCC compilation
// ============================================================================

Game_State game_state;
int running;

// Forward declarations
void main_menu(void);
void character_creation(void);
void exploration(void);
void show_help(void);
void game_over_screen(void);
void handle_exploration_event(void);
void handle_trap(void);
void handle_treasure(void);
void handle_encounter(void);
void handle_combat(Enemy_t* enemy);
void show_full_status(void);
void handle_exit_attempt(void);

void init_game(void) {
    srand((unsigned)time(NULL));
    VDP_SetMode(VDP_MODE_TEXT1);
    VDP_ClearVRAM();
    memset(&game_state, 0, sizeof(Game_State));
    game_state.state = GAME_MENU;
    game_state.turn = 0;
    game_state.player_alive = 1;
    running = 1;
}

void main_menu(void) {
    Print_Clear();
    Print_At(10, 2, "FORTALEZA DE BERDOLOCK");
    Print_At(8, 4, "Um RPG Solitario em MSX");
    Print_At(5, 7, "1 - Novo Jogo");
    Print_At(5, 8, "2 - Continuare");
    Print_At(5, 9, "3 - Como Jogar");
    Print_At(5, 10, "4 - Sair");
    Print_At(5, 13, "Digite sua opcao: ");
    
    int choice = getchar();
    if (choice == '1') game_state.state = GAME_CHARACTER_CREATION;
    else if (choice == '2') game_state.state = GAME_EXPLORATION;
    else if (choice == '3') game_state.state = GAME_HELP;
    else if (choice == '4') running = 0;
}

void character_creation(void) {
    Print_Clear();
    Print_At(10, 2, "CRIACAO DO PERSONAGEM");
    Print_At(2, 6, "Seu personagem comecara com:");
    Print_At(5, 8, "PA (Poder de Ataque): 2d6");
    Print_At(5, 9, "PD (Poder de Defesa): 7");
    Print_At(5, 10, "PV (Pontos Vitais): 2d6");
    
    game_state.player.pa = roll_dice(1, 6) + roll_dice(1, 6);
    game_state.player.pd = 7;
    game_state.player.pv_max = roll_dice(1, 6) + roll_dice(1, 6);
    game_state.player.pv = game_state.player.pv_max;
    game_state.player.weapon = WEAPON_SWORD;
    game_state.player.armor = ARMOR_PLATE;
    game_state.player.shield = 1;
    game_state.player.potions = 0;
    game_state.player.trap_ring = 0;
    game_state.player.magic_sword = 0;
    game_state.player.magic_armor = 0;
    game_state.player.gold = 0;
    
    Print_At(5, 12, "PA rolado: ");
    printf("%d", game_state.player.pa);
    Print_At(5, 13, "PV rolado: ");
    printf("%d", game_state.player.pv_max);
    Print_At(5, 15, "Pressione ENTER para continuar...");
    
    getchar();
    game_state.state = GAME_EXPLORATION;
    game_state.turn = 1;
    game_state.player_alive = 1;
}

void exploration(void) {
    Print_Clear();
    Print_At(5, 1, "=== FORTALEZA DE BERDOLOCK ===");
    Print_At(2, 3, "Turno: ");
    printf("%d/30", game_state.turn);
    
    Print_At(5, 6, "PA: ");
    printf("%d", game_state.player.pa);
    Print_At(20, 6, "PD: ");
    printf("%d", game_state.player.pd);
    Print_At(5, 7, "PV: ");
    printf("%d/%d", game_state.player.pv, game_state.player.pv_max);
    Print_At(5, 10, "Pocoes: ");
    printf("%d", game_state.player.potions);
    Print_At(5, 11, "Ouro: ");
    printf("%d", game_state.player.gold);
    
    Print_At(2, 14, "Acoes:");
    Print_At(5, 15, "1 - Explorar");
    Print_At(5, 16, "2 - Usar Pocao");
    Print_At(5, 17, "3 - Status");
    Print_At(5, 18, "4 - Menu");
    
    Print_At(2, 22, "Escolha: ");
    
    int choice = getchar();
    
    if (choice == '1') {
        handle_exploration_event();
        game_state.turn++;
        if (game_state.turn > 30) game_state.turn = 30;
    } else if (choice == '2') {
        if (game_state.player.potions > 0) {
            game_state.player.pv = game_state.player.pv_max;
            game_state.player.potions--;
        }
        getchar();
    } else if (choice == '3') {
        show_full_status();
    } else if (choice == '4') {
        game_state.state = GAME_MENU;
    }
}

void handle_exploration_event(void) {
    int roll = roll_dice(2, 6);
    
    Print_Clear();
    Print_At(10, 2, "=== EVENTO ===");
    Print_At(2, 4, "Voce rolou: ");
    printf("%d", roll);
    
    if (roll == 3) handle_trap();
    else if (roll == 4 || roll == 12) handle_treasure();
    else if (roll == 7 || roll == 11) handle_encounter();
    else Print_At(2, 6, "Voce encontrou uma secao.");
    
    Print_At(2, 22, "Pressione ENTER...");
    getchar();
}

void handle_trap(void) {
    int trap_type = roll_dice(1, 6);
    int damage = roll_dice(1, 6);
    
    Print_At(2, 6, "Armadilha tipo: ");
    printf("%d", trap_type);
    
    if (trap_type == 6) {
        game_state.player.pv = 0;
        game_state.player_alive = 0;
        game_state.state = GAME_OVER;
    } else {
        game_state.player.pv -= damage;
        if (game_state.player.pv <= 0) {
            game_state.player.pv = 0;
            game_state.player_alive = 0;
            game_state.state = GAME_OVER;
        }
    }
}

void handle_treasure(void) {
    int treasure_type = roll_dice(1, 6);
    
    Print_At(2, 8, "Tesouro: ");
    printf("%d", treasure_type);
    
    if (treasure_type == 2) game_state.player.potions++;
    else if (treasure_type == 5) game_state.player.gold += roll_dice(1, 6) * 1000;
}

void handle_encounter(void) {
    int enemy_type = roll_dice(1, 6);
    Enemy_t enemy;
    
    Print_At(2, 8, "Inimigo tipo: ");
    printf("%d", enemy_type);
    
    enemy.type = enemy_type;
    enemy.pa = 2;
    enemy.pd = 7;
    enemy.pv = 10;
    
    handle_combat(&enemy);
}

void handle_combat(Enemy_t* enemy) {
    Print_Clear();
    Print_At(5, 2, "=== COMBATE ===");
    Print_At(2, 5, "Jogador: ");
    printf("%d PV", game_state.player.pv);
    Print_At(2, 6, "Inimigo: ");
    printf("%d PV", enemy->pv);
    Print_At(2, 22, "Pressione ENTER...");
    getchar();
}

void show_full_status(void) {
    Print_Clear();
    Print_At(8, 2, "=== STATUS ===");
    Print_At(2, 4, "PA: ");
    printf("%d", game_state.player.pa);
    Print_At(2, 5, "PD: ");
    printf("%d", game_state.player.pd);
    Print_At(2, 6, "PV: ");
    printf("%d/%d", game_state.player.pv, game_state.player.pv_max);
    Print_At(2, 22, "Pressione ENTER...");
    getchar();
}

void handle_exit_attempt(void) {
    Print_Clear();
    Print_At(5, 2, "=== SAIDA ===");
    Print_At(2, 6, "Voce escapou!");
    game_state.state = GAME_OVER;
}

void show_help(void) {
    Print_Clear();
    Print_At(8, 2, "=== COMO JOGAR ===");
    Print_At(2, 5, "Explore a masmorra");
    Print_At(2, 6, "Derrote inimigos");
    Print_At(2, 7, "Colete tesouros");
    Print_At(2, 8, "Escape em 30 turnos!");
    Print_At(2, 22, "Pressione ENTER...");
    getchar();
    game_state.state = GAME_MENU;
}

void game_over_screen(void) {
    Print_Clear();
    
    if (game_state.player_alive) {
        Print_At(10, 5, "=== VOCE VENCEU ===");
    } else {
        Print_At(10, 5, "=== GAME OVER ===");
    }
    
    Print_At(5, 9, "Turnos: ");
    printf("%d/30", game_state.turn);
    Print_At(5, 10, "Ouro: ");
    printf("%d", game_state.player.gold);
    
    Print_At(2, 16, "1 - Novo Jogo");
    Print_At(2, 17, "2 - Menu");
    Print_At(2, 18, "3 - Sair");
    
    int choice = getchar();
    if (choice == '1') game_state.state = GAME_CHARACTER_CREATION;
    else if (choice == '2') game_state.state = GAME_MENU;
    else if (choice == '3') running = 0;
}

int main(void) {
    init_game();
    
    while (running) {
        switch (game_state.state) {
            case GAME_MENU:
                main_menu();
                break;
            case GAME_CHARACTER_CREATION:
                character_creation();
                break;
            case GAME_EXPLORATION:
                exploration();
                break;
            case GAME_HELP:
                show_help();
                break;
            case GAME_OVER:
                game_over_screen();
                break;
            default:
                game_state.state = GAME_MENU;
                break;
        }
    }
    
    Print_Clear();
    Print_At(8, 12, "Obrigado por jogar!");
    
    return 0;
}
