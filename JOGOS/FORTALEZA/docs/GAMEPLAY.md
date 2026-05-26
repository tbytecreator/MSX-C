# Fortaleza de Berdolock - Guia de Mecânicas

Documento técnico descrevendo as mecânicas e regras do jogo implementado.

## 1. Ciclo de Jogo

### Loop Principal

```
Menu Principal
    ↓
Criação de Personagem (rolar stats)
    ↓
Loop de Exploração (até morte ou fuga)
    ├─ Explorar (rolar 2d6)
    ├─ Usar Item
    ├─ Ver Status
    └─ Buscar Saída (turno ≥ 30)
    ↓
Game Over (Vitória ou Derrota)
    ↓
Menu Principal
```

## 2. Personagem

### Criação
- **PA (Poder de Ataque)**: 2d6 (resultado: 2-12)
- **PD (Poder de Defesa)**: 7 (fixo no início)
- **PV (Pontos Vitais)**: 2d6 (resultado: 2-12)

### Equipamento Inicial
- Espada normal
- Cota de malha + escudo
- PD total = 7

### Inventário Máximo
- Poções de Cura: 4
- Anel Detetor: 1
- Espada Mágica: 1
- Armadura Mágica: 1
- Ouro: até 14.000 moedas

## 3. Sistema de Exploração

### Rolagem de Evento (2d6)

```
Resultado    Evento
2            Seção (sem evento)
3            Armadilha
4            Tesouro
5            Seção (sem evento)
6            Seção (sem evento)
7            Encontro com inimigo
8            Seção (sem evento)
9            Seção (sem evento)
10           Seção (sem evento)
11           Encontro com inimigo
12           Tesouro
```

**Seção**: Avança um espaço no mapa procedural (sem combate/perigo).

## 4. Sistema de Combate

### Fase 1: Iniciativa
- Jogador rola 1d6
- Inimigo rola 1d6
- Quem tirar maior ataca primeiro

### Fase 2: Cálculo de Dano
**Fórmula**: `Atacante PA + 2d6 - Defensor PD = Dano`

**Exemplo**:
- Jogador PA = 8, rola 2d6 = 7, total = 15
- Inimigo PD = 7
- Dano = 15 - 7 = 8 PV reduzidos

### Fase 3: Alternância
- Se inimigo PV > 0: inimigo contra-ataca
- Se jogador PV > 0: volta para fase 2
- Continua até um lado ter PV ≤ 0

### Condição de Término
- **Jogador vence**: Inimigo PV ≤ 0
- **Jogador perde**: Jogador PV ≤ 0 → GAME OVER
- **Fuga**: Não implementada ainda

## 5. Sistema de Armadilhas

### Ativação
Quando rolagem de exploração = 3

### Detecção
- Sem anel: dano automático
- Com anel: anula armadilha, rola novamente

### Tabela de Dano (1d6)

| D6 | Tipo | Dano | Efeito |
|----|------|------|--------|
| 1 | Alçapão | 1d6 | Direto |
| 2 | Chuva de Dardos | 1d6 | Direto |
| 3 | Ácido | 3d6 | Direto |
| 4 | Chuva de Flechas | 2d6 | Direto |
| 5 | Gás | 1d6 | Direto |
| 6 | Desmoronamento | - | MORTE (PV = 0) |

**Direto**: Ignora PD, reduz diretamente de PV

## 6. Sistema de Tesouros

### Ativação
Quando rolagem de exploração = 4 ou 12

### Tabela de Itens (1d6)

#### 1 - Espada Mágica
- Efeito: PA += 2
- Limite: 1 unidade
- Permanente

#### 2 - Poção de Cura
- Efeito: Restaura PV para máximo
- Limite: 4 no inventário
- Uso: Manual (ação "2")

#### 3 - Anel Detetor de Armadilhas
- Efeito: Evita uma armadilha
- Limite: 1 unidade
- Ativação: Automática ao detectar armadilha

#### 4 - Armadura Mágica
- Efeito: PD = 9
- Limite: 1 unidade
- Permanente

#### 5 - Ouro
- Efeito: 1d6 × 1.000 moedas
- Limite: até 14.000 total
- Uso: Pontuação final

#### 6 - Item Amaldiçoado
- Efeito: -1d6 PV (imediato)
- Limite: Pode encontrar várias vezes
- Risco: Pode levar à morte

## 7. Sistema de Saída (após 30 turnos)

### Ativação
Disponível quando `turno ≥ 30`

### Tabela de Saída (1d6)

| D6 | Resultado | Efeito |
|----|-----------|--------|
| 1 | Encontro | Combate surpresa, depois rola novamente |
| 2 | **VITÓRIA** | Conseguiu escapar! Fim de jogo |
| 3 | Queda | -1d6 PV, rola novamente |
| 4 | Pedra | Caminho bloqueado, rola novamente |
| 5 | Esqueleto | Teste par/ímpar para passar |
| 6 | Desespero | Precisa 1-3 em 1d6 para sair |

### Condições de Vitória
- Chegar a turno ≥ 30
- Rolar 2 (VITÓRIA direto) na tabela de saída
- OU: Passar pelos testes subsequentes até conseguir sair

### Pontuação Final
- Base: 1.000 pontos
- + Ouro coletado
- + 100 por cada turno restante (30 - turno_atual)
- + Bônus por itens mágicos encontrados

## 8. Inimigos

### Tabela de Inimigos (1d6)

| D6 | Nome | PA | PD | PV | Estratégia |
|----|------|----|----|-------|-----------|
| 1 | Aranha Gigante | 2d6 | 7 | 15 | Resistente |
| 2 | Morto Vivo | 2d6 | 5 | 8 | Fraco |
| 3 | Fantasma | 2d6 | 9 | 10 | Defensivo |
| 4 | Orco | 2d6 | 6 | 7 | Comum |
| 5 | Troll | 2d6 | 8 | 14 | Muito resistente |
| 6 | Guerreiro do Caos | 2d6 | 9 | 12 | Balanceado |

### Após Vitória
- 50% de chance de encontrar tesouro
- +1 ao contador de inimigos derrotados
- Retorna para exploração (turno++, estado = EXPLORATION)

## 9. Sistema de Turnos

### Contagem
- Começa: turno = 1
- Incrementa: +1 a cada exploração
- Máximo: 30
- Objetivo: Encontrar saída após turno 30

### Efeito dos Turnos
- Até turno 29: Exploração normal
- Turno 30: Última exploração, então pode buscar saída
- Saída: Tabela especial disponível

## 10. Condições de Game Over

### Derrota
- PV jogador ≤ 0
- Causa: Combate perdido, armadilha letal, item amaldiçoado

### Vitória
- Conseguir sair da masmorra após 30 turnos
- Métodos:
  1. Rolar 2 na tabela de saída
  2. Passar pelos testes de 5 ou 6
  3. Sobreviver a encontros subsequentes

## 11. Economia de Memória

### Estruturas Principais
```c
typedef struct {
    int pa, pd, pv, pv_max;      // 16 bytes
    int weapon, armor, shield;    // 12 bytes
    int potions, trap_ring;       // 8 bytes
    int magic_sword, magic_armor; // 8 bytes
    int gold;                     // 4 bytes
} Player_t;                       // ~48 bytes

typedef struct {
    int type, pa, pd, pv;        // 16 bytes
} Enemy_t;                        // ~16 bytes

typedef struct {
    int state, turn, player_alive; // 12 bytes
    Player_t player;               // 48 bytes
    // Total: ~60 bytes
} Game_State;
```

### Total
Aproximadamente 200-300 bytes para toda a estrutura do jogo, deixando espaço para pilha, heap e código.

## 12. Fluxo de Decisões em Exploração

```
Explorar
    ↓
Rolar 2d6
    ↓
[2,5,6,8,9,10] → Seção (nada acontece)
[3] → Armadilha
[4,12] → Tesouro
[7,11] → Encontro
    ↓
Processar Evento
    ├─ Armadilha
    │   ├─ Tem anel? → Evita, consome anel
    │   └─ Sem anel? → Sofre dano
    ├─ Tesouro
    │   └─ Rolar 1d6, obter item
    └─ Encontro
        └─ Combate até morte de um lado
    ↓
turno++
    ↓
[turno ≤ 30] → Volta para Menu de Ações
[turno > 30] → Opção de "Buscar Saída" ativada
```

## 13. Variáveis e Estados

### Estados do Jogo
- `GAME_MENU` = 0
- `GAME_CHARACTER_CREATION` = 1
- `GAME_EXPLORATION` = 2
- `GAME_HELP` = 3
- `GAME_OVER` = 4

### Flags Booleanas
- `player_alive`: 1 = vivo, 0 = morto
- `magic_sword`: 1 = tem, 0 = não tem
- `magic_armor`: 1 = tem, 0 = não tem
- `trap_ring`: 1 = tem, 0 = não tem

### Contadores
- `turn`: 1-30 (ou 31 se continuar a explorar)
- `enemies_defeated`: 0-N
- `potions`: 0-4
- `gold`: 0-14000

---

**Última atualização: Maio 2026**
