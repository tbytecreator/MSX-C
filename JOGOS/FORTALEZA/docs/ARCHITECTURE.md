# Fortaleza de Berdolock - Documentação Técnica

## Arquitetura do Projeto

### Organização de Diretórios

```
fortaleza/
├── src/                  # Código fonte
│   ├── main.c           # Loop principal do jogo (1200+ linhas)
│   ├── game.h           # Estruturas e definições
│   ├── game.c           # Funções de utilidade (dados, aleatório)
│   ├── ui.h             # Interface de terminal
│   └── ui.c             # Implementação da UI
├── rom/                 # Binários compilados
│   └── fortaleza.rom   # ROM 64KB (gerado)
├── dsk/                 # Imagens de disquete (futuro)
├── docs/                # Documentação
│   ├── GAMEPLAY.md      # Mecânicas do jogo
│   ├── ARCHITECTURE.md  # Este arquivo
│   └── CODING.md        # Guia de codificação
├── Makefile             # Compilação
├── make.sh              # Build + teste
├── requisitos.md        # Especificação do projeto
├── fortaleza.pdf        # Regras originais
└── README.md            # Documentação principal
```

## Compilação

### SDCC (Small Device C Compiler)

O projeto usa SDCC compilado para Z80 (processador do MSX).

#### Flags SDCC

```
-mz80                           # Target: Z80 processor
--constseg CODE                # Segment para constantes
--code-loc 0x8000              # Endereço de código: 0x8000 (32KB)
--data-loc 0xC000              # Endereço de dados: 0xC000 (48KB)
--max-allocs-per-node 10000    # Limite de alocações
```

#### Mapa de Memória MSX

```
0x0000 - 0x00FF    Vetor de interrupção
0x0100 - 0x3FFF    BIOS/Sistema
0x4000 - 0x7FFF    Cartridge/ROM (16KB)
0x8000 - 0xBFFF    Cartridge/ROM (16KB) ← Código
0xC000 - 0xFFFF    RAM (16KB) ← Dados
```

### Processo de Compilação

```bash
# Compilação via make
make -C . rom

# Passos internos:
# 1. SDCC compila cada .c → .rel (object file)
# 2. Linker junta todos os .rel → fortaleza.rom
# 3. ROM é copiado para rom/fortaleza.rom
```

### Artefatos Gerados

| Arquivo | Descrição | Tamanho |
|---------|-----------|---------|
| `src/*.rel` | Object files | ~5-15 KB cada |
| `src/*.lst` | Assembly listing | ~10-30 KB |
| `src/*.sym` | Símbolos (debug) | ~5 KB |
| `fortaleza.hex` | Hex file (intermediário) | ~60 KB |
| `rom/fortaleza.rom` | ROM final | ~64 KB |

## Estrutura de Código

### main.c (Programa Principal)

**Funções Principais:**

```c
void init_game()                // Inicializa MSX + game state
void main_menu()                // Tela de menu
void character_creation()       // Criação do personagem
void exploration()              // Loop de exploração
void handle_exploration_event() // Processa evento de exploração
void handle_trap()              // Armadilha
void handle_treasure()          // Tesouro
void handle_encounter()         // Encontro com inimigo
void handle_combat(Enemy*)      // Sistema de combate
void handle_exit_attempt()      // Tenta escapar (turno 30+)
void show_full_status()         // Status completo do jogador
void show_help()                // Tela de ajuda
void game_over_screen()         // Tela final
int main()                      // Entry point
```

**Global State:**

```c
Game_State game_state;          // Estado geral do jogo
int running;                    // Boolean: continua o loop?
```

### game.h (Definições)

**Enumerações:**

```c
typedef enum {
    GAME_MENU,
    GAME_CHARACTER_CREATION,
    GAME_EXPLORATION,
    GAME_HELP,
    GAME_OVER
} GameState_t;

typedef enum { WEAPON_SWORD, WEAPON_MAGIC_SWORD } Weapon_t;
typedef enum { ARMOR_PLATE, ARMOR_MAGIC } Armor_t;
```

**Estruturas:**

```c
typedef struct {
    int pa, pd, pv, pv_max;
    Weapon_t weapon;
    Armor_t armor;
    int shield;
    int potions, trap_ring;
    int magic_sword, magic_armor;
    int gold;
} Player_t;

typedef struct {
    int type, pa, pd, pv;
} Enemy_t;

typedef struct {
    GameState_t state;
    Player_t player;
    int turn, player_alive;
    int enemies_defeated;
} Game_State;
```

### game.c (Utilidades)

```c
int roll_dice(int num_dice, int sides)  // 2d6 = roll_dice(2, 6)
int random_range(int min, int max)      // Aleatório em intervalo
```

### ui.h/ui.c (Interface de Terminal)

**Funções de Terminal:**

```c
void Print_Clear()              // Limpa tela (ANSI: \033[2J\033[H)
void Print_At(int x, int y, const char* text)   // Posiciona e imprime
void Print_Char(char c)         // Caractere
void Print_String(const char* str)  // String
void Print_SetCursor(int x, int y)  // Move cursor
char Print_GetChar()            // Lê teclado
void Print_Int(int value)       // Inteiro
void Print_HLine(int x, int y, int len, char ch)    // Linha horiz
void Print_VLine(int x, int y, int len, char ch)    // Linha vert
void Print_Box(int x, int y, int w, int h, char ch) // Caixa
```

**Códigos ANSI Utilizados:**

```
\033[2J      → Limpa tela
\033[H       → Cursor home (0,0)
\033[Y;XH    → Posiciona cursor (1-based)
```

## MSXgl Integration

### Funções MSXgl Usadas

```c
#include "msxgl.h"

VDP_SetMode(VDP_MODE_TEXT1)    // Modo texto 40x24
VDP_ClearVRAM()                // Limpa VRAM
```

### Modo Texto

- **Resolução**: 40 colunas × 24 linhas
- **Caracteres**: ASCII estendido
- **Paleta**: 16 cores (texto monocromo neste jogo)

## Fluxo de Execução

```
main()
    ↓
init_game()
    ├─ srand(time()) → inicializa rand
    ├─ VDP_SetMode(TEXT1) → modo texto
    ├─ VDP_ClearVRAM() → limpa tela
    └─ memset(game_state) → limpa estado
    ↓
while(running) {
    switch(game_state.state) {
        case GAME_MENU → main_menu()
        case GAME_CHARACTER_CREATION → character_creation()
        case GAME_EXPLORATION → exploration()
        case GAME_HELP → show_help()
        case GAME_OVER → game_over_screen()
    }
}
    ↓
Print_Clear()
exit(0)
```

## Tamanho de Memória

### Estimativas

| Componente | Tamanho |
|-----------|---------|
| Código (main.c) | ~15 KB |
| Código (game.c) | ~1 KB |
| Código (ui.c) | ~3 KB |
| Estruturas globais | ~500 bytes |
| Pilha (stack) | ~2 KB |
| Heap (dinâmico) | Mínimo |
| **Total** | **~21 KB** |

### Budget Disponível

- ROM MSX: até 64 KB ✅ (temos ~21 KB, sobram ~43 KB)
- RAM MSX: ~16 KB (usado ~2-3 KB) ✅

## Otimizações Possíveis

### Para Reduzir Tamanho

1. **Strings Constantes**: Usar `const char*`
2. **Switch vs If**: Usar `switch` para múltiplas condições
3. **Funções Inline**: `#define` para funções pequenas
4. **Remover Comentários**: Strip comments na compilação

### Para Melhorar Performance

1. **Pré-computar Tabelas**: Arrays estáticos para inimigos, itens
2. **Cache de Resultados**: Evitar cálculos repetidos
3. **Usar Registradores**: Compiler já otimiza via SDCC
4. **Minimizar I/O**: Buffer de saída

## Testes

### Teste de Compilação

```bash
make -C . clean rom
# Verifica se rom/fortaleza.rom foi criado
ls -lah rom/fortaleza.rom
```

### Teste de Execução

```bash
./make.sh build
# Abre OpenMSX com o jogo
```

### Teste Manual

1. Selecionar "1 - Novo Jogo" no menu
2. Observar criação de personagem
3. Testar cada ação (explorar, usar poção, etc.)
4. Verificar cálculos de combate
5. Alcançar 30 turnos
6. Testar saída

## Debugging

### Compilação com Debug

```bash
SDCC -debug ... main.c
```

Gera `.cdb` (compiler database) para debugging.

### Executar em OpenMSX com Debug

```bash
flatpak run org.openmsx.openMSX -machine MSX1 -cart rom/fortaleza.rom
```

Abrir console do OpenMSX (F12) para debugging.

## Build System

### Makefile Targets

| Target | Descrição |
|--------|-----------|
| `make rom` | Compila ROM |
| `make dsk` | Compila DSK (futuro) |
| `make clean` | Remove artefatos |
| `make distclean` | Remove tudo gerado |
| `make help` | Mostra ajuda |

### make.sh Targets

| Comando | Descrição |
|---------|-----------|
| `./make.sh build` | Compila e executa (padrão) |
| `./make.sh compile` | Apenas compila |
| `./make.sh run` | Executa ROM existente |
| `./make.sh check` | Verifica dependências |
| `./make.sh clean` | Limpa artefatos |
| `./make.sh help` | Mostra ajuda |

## Extensões Futuras

### Curto Prazo
- [ ] Sistema de salvamento em arquivo
- [ ] Carregamento de jogo salvo
- [ ] Contador visual de inimigos no jogo

### Médio Prazo
- [ ] Imagem de disquete (.DSK)
- [ ] Efeitos sonoros (PSG)
- [ ] Animações de combate
- [ ] Ranking de pontuações

### Longo Prazo
- [ ] Geração visual do mapa (gráficos)
- [ ] Múltiplos níveis de dificuldade
- [ ] Suporte a mouse
- [ ] Versão para MSX2 com gráficos

## Referências Úteis

- SDCC Manual: https://sdcc.sourceforge.net/doc/
- Z80 ISA: https://www.msx.org/
- MSXgl: https://github.com/aoineko-fr/MSXgl
- MSX Emulator (OpenMSX): https://openmsx.org/

---

**Última atualização: Maio 2026**
