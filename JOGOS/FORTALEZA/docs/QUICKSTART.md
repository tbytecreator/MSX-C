# Fortaleza de Berdolock - Quick Start Guide

Guia rápido para começar a desenvolver o jogo.

## ⚡ 5 Minutos para Começar

### 1. Instalar Dependências

```bash
# Ubuntu/Debian
sudo apt-get install sdcc flatpak
flatpak install flathub org.openmsx.openMSX

# Fedora
sudo dnf install sdcc flatpak
flatpak install flathub org.openmsx.openMSX

# Arch
sudo pacman -S sdcc flatpak
flatpak install flathub org.openmsx.openMSX
```

### 2. Verificar Instalação

```bash
cd /home/tbytecreator/Dev/tbc/MSX-C/JOGOS/FORTALEZA
./make.sh check
```

### 3. Compilar e Testar

```bash
./make.sh
```

A ROM será compilada e aberta automaticamente no OpenMSX.

---

## 🎮 Como Jogar

1. **Selecione "1 - Novo Jogo"** no menu
2. **Seu personagem recebe:**
   - PA (Poder de Ataque): 2d6
   - PD (Poder de Defesa): 7
   - PV (Pontos Vitais): 2d6

3. **Cada turno, escolha uma ação:**
   - `1` = Explorar (rolar 2d6)
   - `2` = Usar Poção
   - `3` = Ver Status
   - `4` = Salvar Jogo
   - `5` = Menu Principal
   - `6` = Buscar Saída (após turno 30)

4. **Eventos possíveis na exploração:**
   - Seção (sem nada)
   - Armadilha (sofre dano ou evita com anel)
   - Tesouro (encontra item/ouro)
   - Inimigo (combate)

5. **Objetivo:** Alcançar 30 turnos e conseguir sair!

---

## 📝 Comandos Úteis

### Build
```bash
./make.sh build      # Compilar e executar (padrão)
./make.sh compile    # Apenas compilar
./make.sh run        # Executar ROM existente
```

### Desenvolvimento
```bash
./make.sh clean      # Limpar artefatos
./make.sh help       # Ver todos os comandos
make -C . distclean  # Remover tudo gerado
```

### Edição
```bash
nano src/main.c      # Editar código
make -C . clean      # Limpar antes de recompilar
./make.sh compile    # Recompilar
```

---

## 📂 Arquivos Importantes

| Arquivo | Descrição |
|---------|-----------|
| `src/main.c` | Lógica do jogo (édite aqui) |
| `README.md` | Documentação completa |
| `docs/GAMEPLAY.md` | Como o jogo funciona |
| `Makefile` | Compilação |
| `make.sh` | Build automation |

---

## 🐛 Se Algo Não Funcionar

### OpenMSX não abre

```bash
flatpak list --app | grep OpenMSX
# Se não mostrar, instale:
flatpak install flathub org.openmsx.openMSX
```

### SDCC não encontrado

```bash
which sdcc
# Se não retornar nada:
sudo apt-get install sdcc
```

### Erro de compilação

```bash
./make.sh clean
./make.sh compile
```

---

## 💻 Editando o Código

### Estrutura Básica

```c
// src/main.c é onde a maioria da lógica está
// Principais funções:

main()                   // Entry point
├─ init_game()          // Inicializa
└─ while(running) {     // Loop principal
    ├─ main_menu()      // Menu
    ├─ character_creation() // Criar personagem
    ├─ exploration()    // Jogar
    └─ game_over_screen() // Fim
}
```

### Modificar o Jogo

**Exemplo: Aumentar dano de combate**

```c
// src/main.c, linha ~350 aprox
// Procure por:
int player_damage = (roll_dice(2, 6) + game_state.player.pa) - enemy->pd;

// Mude para dar +1 de bônus:
int player_damage = (roll_dice(2, 6) + 1 + game_state.player.pa) - enemy->pd;

// Recompile:
./make.sh compile
```

---

## 📊 Status do Projeto

✅ **Funcionalidades Principais:**
- Loop de jogo completo
- Sistema de combate
- Armadilhas e tesouros
- Inventário
- 30 turnos
- Saída procedural

⏳ **Possíveis Adições:**
- Salvamento de jogo
- Som
- Gráficos
- Múltiplos níveis

---

## 🎯 Próximos Passos

1. **Testar o Jogo**
   ```bash
   ./make.sh
   ```

2. **Ler Documentação**
   - [README.md](README.md) - Visão geral
   - [docs/GAMEPLAY.md](docs/GAMEPLAY.md) - Mecânicas
   - [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md) - Técnico

3. **Modificar Código**
   - Edite `src/main.c`
   - Execute `./make.sh compile`
   - Teste no OpenMSX

4. **Entender Tabelas**
   - Enemigos (linha ~370)
   - Armadilhas (linha ~290)
   - Tesouros (linha ~320)
   - Saída (linha ~420)

---

## 🆘 Precisa de Ajuda?

### Documentação
- **README.md** - Tudo sobre o jogo
- **docs/GAMEPLAY.md** - Como funciona
- **docs/ARCHITECTURE.md** - Estrutura técnica
- **docs/CODING.md** - Estilo de código

### Recursos Online
- [SDCC Docs](https://sdcc.sourceforge.net/doc/)
- [MSXgl](https://github.com/aoineko-fr/MSXgl)
- [MSX Wiki](https://www.msx.org/)

---

## ⏱️ Tempo Estimado

| Tarefa | Tempo |
|--------|-------|
| Instalar dependências | 5-10 min |
| Compilar | 30-60 seg |
| Jogar uma partida | 10-15 min |
| Fazer uma modificação | 2-5 min |

---

**Divirta-se desenvolvendo para MSX! 🎮**

*Última atualização: Maio 2026*
