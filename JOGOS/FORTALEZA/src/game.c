#include <stdlib.h>
#include "game.h"

// ============================================================================
// Dice and Random Functions
// ============================================================================

int roll_dice(int num_dice, int sides) {
    int total = 0;
    int i;
    
    for (i = 0; i < num_dice; i++) {
        total += (rand() % sides) + 1;
    }
    
    return total;
}

int random_range(int min, int max) {
    if (min >= max) return min;
    return min + (rand() % (max - min + 1));
}
