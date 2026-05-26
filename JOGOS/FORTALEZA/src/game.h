#ifndef __GAME_H__
#define __GAME_H__

#include <stdint.h>

// ============================================================================
// Game State Enums
// ============================================================================

typedef enum {
    GAME_MENU,
    GAME_CHARACTER_CREATION,
    GAME_EXPLORATION,
    GAME_HELP,
    GAME_OVER
} GameState_t;

typedef enum {
    WEAPON_SWORD = 1,
    WEAPON_MAGIC_SWORD = 2
} Weapon_t;

typedef enum {
    ARMOR_PLATE = 1,
    ARMOR_MAGIC = 2
} Armor_t;

// ============================================================================
// Player Structure
// ============================================================================

typedef struct {
    int pa;                 // Power of Attack (2d6)
    int pd;                 // Power of Defense (7 base)
    int pv;                 // Current Vitality Points
    int pv_max;             // Max Vitality Points
    
    // Equipment
    Weapon_t weapon;
    Armor_t armor;
    int shield;
    
    // Inventory
    int potions;            // Potion of Cure (max 4)
    int trap_ring;          // Trap Detector Ring (0 or 1)
    int magic_sword;        // Magic Sword modifier (0 or 1)
    int magic_armor;        // Magic Armor modifier (0 or 1)
    int gold;               // Gold collected (max 14000)
    
} Player_t;

// ============================================================================
// Enemy Structure
// ============================================================================

typedef struct {
    int type;               // Enemy type (1-6)
    int pa;                 // Power of Attack
    int pd;                 // Power of Defense
    int pv;                 // Vitality Points
} Enemy_t;

// ============================================================================
// Game State Structure
// ============================================================================

typedef struct {
    GameState_t state;
    Player_t player;
    
    int turn;               // Current turn (1-30)
    int player_alive;       // Boolean: player still alive
    int enemies_defeated;   // Counter for defeated enemies
    
} Game_State;

// ============================================================================
// Game Functions
// ============================================================================

/**
 * Roll dice
 * @param num_dice Number of dice to roll
 * @param sides Number of sides per die
 * @return Sum of all rolled dice
 */
int roll_dice(int num_dice, int sides);

/**
 * Get random number between min and max (inclusive)
 */
int random_range(int min, int max);

#endif // __GAME_H__
