# Guia de Codificação - Fortaleza de Berdolock

Convenções e padrões para desenvolvimento do projeto.

## 1. Estilo de Código

### Convenção de Nomes

#### Variáveis
- `snake_case` para variáveis locais e globais
- `camelCase` para nomes internos (MSXgl)
- Prefixos descritivos quando necessário:
  - `is_*` para booleanos
  - `get_*` para getters
  - `set_*` para setters
  - `handle_*` para handlers

```c
int player_alive;           // ✓ Bom
int playerAlive;            // ✗ Evitar
int is_exploring;           // ✓ Bom para booleano
int player_status;          // ✓ Descritivo
```

#### Estruturas e Tipos
- `PascalCase` com sufixo `_t` para tipos

```c
typedef struct {
    int pa;
    int pd;
} Player_t;                 // ✓ Bom

typedef struct {
    int pa;
    int pd;
} player;                   // ✗ Evitar
```

#### Constantes e Macros
- `UPPER_SNAKE_CASE`

```c
#define MAX_POTIONS 4       // ✓ Bom
#define max_potions 4       // ✗ Evitar
#define GAME_VERSION "1.0"  // ✓ Bom
```

#### Funções
- `snake_case` em geral
- `Print_*` para funções de UI (convenção MSXgl)

```c
void handle_combat()        // ✓ Bom
void HandleCombat()         // ✗ Evitar
void Print_At()             // ✓ Conveção MSXgl
```

### Indentação

- **4 espaços** (não tabs)
- Máximo 80 caracteres por linha (soft limit 100)

```c
// ✓ Bom
if (game_state.player.pv <= 0) {
    game_state.player_alive = 0;
    game_state.state = GAME_OVER;
}

// ✗ Evitar
if(game_state.player.pv<=0){
game_state.player_alive=0;
game_state.state=GAME_OVER;
}
```

### Chaves

- **K&R Style** (chave de abertura na mesma linha)

```c
// ✓ Bom
if (condition) {
    statement();
}

// ✗ Evitar
if (condition)
{
    statement();
}
```

### Espaçamento

```c
// ✓ Espaço antes de operadores
int result = player_pa + enemy_pa;
if (pv <= 0)

// ✗ Sem espaço
int result=player_pa+enemy_pa;
if(pv<=0)
```

## 2. Comentários

### Estilo de Comentários

```c
// Uma linha - use // para comentários curtos

/*
 * Múltiplas linhas
 * Use /* */ para blocos maiores
 * Uma sentença por linha
 */
```

### Documentação de Função

```c
/**
 * Roll one or more dice
 * @param num_dice Number of dice (1-6)
 * @param sides Number of sides per die (usually 6)
 * @return Sum of all dice rolled
 */
int roll_dice(int num_dice, int sides) {
    // Implementation
}
```

### Comentários de Seção

```c
// ============================================================================
// Section Name
// ============================================================================

// Subsection
```

## 3. Tratamento de Erros

### Validação de Entrada

```c
// ✓ Bom - valida antes de usar
if (num_dice < 1 || num_dice > 6) {
    return 0;  // Erro: retorna 0
}

// ✗ Evitar - assume entrada válida
int total = roll_dice(num_dice, sides);
```

### Condições de Erro

```c
// ✓ Bom - trata casos limite
if (game_state.player.potions <= 0) {
    Print_At(2, 23, "Voce nao tem potcoes!");
    return;
}

// ✗ Evitar - pode causar underflow
game_state.player.potions--;
```

## 4. Estrutura de Arquivos

### Header Files (.h)

```c
#ifndef __GAME_H__          // Include guard
#define __GAME_H__

// System includes
#include <stdio.h>
#include <stdlib.h>

// Project includes
#include "msxgl.h"

// ============================================================================
// Tipos e Definições
// ============================================================================

// Type definitions
typedef struct {
    int pa;
} Player_t;

// Function declarations
int roll_dice(int num_dice, int sides);

#endif // __GAME_H__
```

### Source Files (.c)

```c
#include <stdio.h>          // System includes first
#include <stdlib.h>

#include "game.h"           // Project includes after
#include "ui.h"

// ============================================================================
// Implementação
// ============================================================================

int roll_dice(int num_dice, int sides) {
    // Implementation
}
```

## 5. Constantes e Macroinstruções

### Constantes Mágicas

```c
// ✓ Bom - usa constantes
#define MAX_POTIONS 4
#define MAX_GOLD 14000
#define STARTING_PD 7

if (game_state.player.potions < MAX_POTIONS) {
    game_state.player.potions++;
}

// ✗ Evitar - números "mágicos"
if (game_state.player.potions < 4) {
    game_state.player.potions++;
}
```

### Macros Simples

```c
// ✓ Bom - macro simples
#define MIN(a, b) ((a) < (b) ? (a) : (b))
#define MAX(a, b) ((a) > (b) ? (a) : (b))

// ✗ Evitar - função quando macro seria melhor
int get_min(int a, int b) {
    return a < b ? a : b;
}
```

## 6. Tipos de Dados

### Tipos MSX-Específicos

```c
// Z80 é 16-bit
typedef unsigned short uint16_t;
typedef short int16_t;
typedef unsigned char uint8_t;
typedef char int8_t;

// ✓ Bom para MSX
uint8_t trap_type;         // 0-6
uint16_t gold;             // 0-14000

// ✗ Pode ser ineficiente
int trap_type;              // waste
long gold;                  // waste (20-bit no Z80)
```

## 7. Estrutura de Projeto

### Organização Lógica

```c
// ============================================================================
// Includes
// ============================================================================

#include <stdio.h>
#include "game.h"

// ============================================================================
// Type Definitions
// ============================================================================

typedef struct {
    // ...
} Enemy_t;

// ============================================================================
// Global Variables
// ============================================================================

Game_State game_state;

// ============================================================================
// Function Declarations (forward)
// ============================================================================

void handle_combat(Enemy* enemy);

// ============================================================================
// Function Implementations
// ============================================================================

void handle_combat(Enemy* enemy) {
    // Implementation
}
```

## 8. Performance e Otimização

### Evitar Alocações Dinâmicas

```c
// ✓ Bom - usa stack/estática
Player_t player;            // Stack
Enemy_t enemies[10];        // Stack array

// ✗ Evitar em MSX - malloc é caro
Player_t* player = malloc(sizeof(Player_t));
```

### Reutilizar Variáveis

```c
// ✓ Bom - reutiliza variável
int result;
for (i = 0; i < 10; i++) {
    result = roll_dice(1, 6);
}

// ✗ Menos eficiente - aloca nova toda vez
for (i = 0; i < 10; i++) {
    int result = roll_dice(1, 6);
}
```

### Funções Pequenas Inline

```c
// ✓ Para funções muito simples
#define GET_PA(p) ((p).pa)

// Ou use static inline
static inline int get_pa(Player_t p) {
    return p.pa;
}
```

## 9. Convenções de Retorno

### Valores de Retorno

```c
// ✓ Bom - retorna inteiro com significado
int roll_dice(int num_dice, int sides) {
    // Retorna soma dos dados (2-72 para 2d6)
    return total;
}

// ✓ Bom - retorna 0 para erro
int random_range(int min, int max) {
    if (min >= max) return 0;  // Erro
    return min + (rand() % (max - min + 1));
}

// ✓ Bom para void
void Print_At(int x, int y, const char* text) {
    printf("\033[%d;%dH", y + 1, x + 1);
    printf("%s", text);
}
```

## 10. Padrões Comuns

### Estado Machine (Game States)

```c
while (running) {
    switch (game_state.state) {
        case GAME_MENU:
            main_menu();
            break;
        case GAME_EXPLORATION:
            exploration();
            break;
        // ...
    }
}
```

### Event Handler Pattern

```c
void handle_exploration_event() {
    int roll = roll_dice(2, 6);
    
    if (roll == 3) {
        handle_trap();
    } else if (roll == 4 || roll == 12) {
        handle_treasure();
    }
    // ...
}
```

### Guard Clauses

```c
// ✓ Bom - guard clauses reduzem indentação
void use_potion() {
    if (game_state.player.potions <= 0) {
        Print_At(2, 23, "Sem potcoes!");
        return;
    }
    
    game_state.player.pv = game_state.player.pv_max;
    game_state.player.potions--;
}
```

## 11. Testabilidade

### Funções Puras

```c
// ✓ Bom - pura, testável
int calculate_damage(int pa, int pd) {
    int roll = roll_dice(2, 6);
    return pa + roll - pd;
}

// ✗ Afeta estado global
void calculate_damage(Enemy* enemy) {
    game_state.player.pv -= enemy_damage;
}
```

## 12. Checklist de Codificação

- [ ] Segue convenção de nomes
- [ ] Indentação 4 espaços
- [ ] Linhas < 100 caracteres
- [ ] Comentários significativos
- [ ] Sem números mágicos (use constantes)
- [ ] Validação de entrada
- [ ] Trata casos limite
- [ ] Sem memory leaks (MSX é limitado)
- [ ] Funções tem responsabilidade única
- [ ] Headers têm include guards

---

**Última atualização: Maio 2026**
