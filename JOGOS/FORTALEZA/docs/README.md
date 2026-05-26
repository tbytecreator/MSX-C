# Fortaleza de Berdolock - MSX Adventure Game

Um jogo de aventura de texto baseado no clássico RPG solitário **"A Fortaleza de Berdolock"**, implementado em **C** para computador **MSX** usando a biblioteca **MSXgl**.

## 📖 Descrição

**Fortaleza de Berdolock** é um RPG solitário narrativo que replicação digital do jogo em PDF homônimo. O jogador explora uma masmorra procedural, enfrenta criaturas, coleta tesouros e busca escapar com vida.

### Características

- 🎮 Sistema de verbos interativo (explorar, combater, usar itens, etc.)
- 🎲 Mecânicas baseadas em dados (d6, 2d6)
- ⚔️ Sistema de combate tático (PA vs PD)
- 🏴 Geração procedural de eventos
- 💰 Coleta de tesouros e itens mágicos
- 🎯 30 turnos para exploração e busca pela saída
- 📊 Sistema completo de stats (PA, PD, PV)

## 🛠️ Ferramentas de Desenvolvimento

- **SDCC** - Compilador C para Z80 (MSX)
- **MSXgl** - Biblioteca de gráficos para MSX
- **OpenMSX** - Emulador de MSX (via Flatpak)
- **Flatpak** - Sandbox/container para aplicações

## 📁 Estrutura do Projeto

```ascii
fortaleza/
├── src/              # Código fonte
│   ├── main.c        # Programa principal
│   ├── game.c        # Lógica do jogo
│   ├── game.h        # Header do game
│   ├── ui.c          # Interface de usuário
│   └── ui.h          # Header da UI
├── rom/              # Arquivos ROM compilados
├── dsk/              # Imagens de disquete (futuro)
├── docs/             # Documentação
├── Makefile          # Script de compilação
├── make.sh           # Script build + teste
├── README.md         # Este arquivo
├── requisitos.md     # Requisitos do projeto
└── fortaleza.pdf     # Regras do jogo original
```

## 🚀 Quick Start

### 1. Verificar Dependências

```bash
./make.sh check
```

Este comando verifica se SDCC, Flatpak e OpenMSX estão instalados.

### 2. Compilar e Testar

```bash
./make.sh build
```

Ou simplesmente:

```bash
./make.sh
```

Este comando:

- ✅ Verifica dependências
- ✅ Compila o ROM
- ✅ Inicia OpenMSX com o jogo

### 3. Apenas Compilar (sem executar)

```bash
./make.sh compile
```

### 4. Executar ROM Existente

```bash
./make.sh run
```

## 📋 Requisitos de Sistema

### Dependências Obrigatórias

- **SDCC** - Compilador C para Z80
- **Node.js** - Runtime JavaScript (necessário para MSXgl build system)
- **Flatpak** - Para executar OpenMSX em sandbox
- **OpenMSX** - Emulador de MSX (instalado via Flatpak)

### Linux (Ubuntu/Debian)

```bash
# Instalar SDCC
sudo apt-get install sdcc

# Instalar Node.js (necessário para MSXgl)
sudo apt-get install nodejs npm

# Instalar Flatpak
sudo apt-get install flatpak

# Instalar OpenMSX via Flatpak
flatpak install flathub org.openmsx.openMSX
```

### Linux (Fedora)

```bash
sudo dnf install sdcc nodejs npm flatpak
flatpak install flathub org.openmsx.openMSX
```

### Linux (Arch)

```bash
sudo pacman -S sdcc nodejs npm flatpak
flatpak install flathub org.openmsx.openMSX
```

## 🎮 Como Jogar

### Objetivo

Explore a masmorra da Fortaleza de Berdolock, sobreviva aos encontros, colete tesouros e encontre a saída em no máximo 30 turnos.

### Sistema de Comandos

O jogo usa um sistema de verbos/ações disponíveis:

| Comando                   | Descrição                                 |
|---------------------------|-------------------------------------------|
| **1 - Explorar**          | Avança na masmorra (rola 2d6 para evento) |
| **2 - Usar Poção**        | Restaura todos os PV perdidos             |
| **3 - Status**            | Mostra stats, inventário e turno atual    |
| **4 - Salvar Jogo**       | Salva o progresso (futuro)                |
| **5 - Sair para Menu**    | Volta ao menu principal                   |
| **6 - Buscar Saida**      | Tenta sair (disponível após 30 turnos)    |

### Tabela de Eventos (Exploração - 2d6)

| Resultado         | Evento                                |
|-------------------|---------------------------------------|
| 2, 5, 6, 8, 9, 10 | Encontra uma **SEÇÃO** da masmorra    |
| 3                 | Aciona uma **ARMADILHA**              |
| 4, 12             | Encontra um **TESOURO**               |
| 7, 11             | Encontra um **INIMIGO**               |

### Stats do Personagem

- **PA** (Poder de Ataque): Rolado em 2d6 no início (2-12)
- **PD** (Poder de Defesa): 7 (base), pode aumentar com armadura mágica
- **PV** (Pontos Vitais): Rolado em 2d6 no início (2-12)

### Combate

1. Cada lado rola 1d6 para iniciativa
2. Quem ganha ataca primeiro: `PA + 2d6 - PD adversário = Dano`
3. Reduz PV do adversário
4. Continua até um lado chegar a 0 PV

### Itens e Tesouros (1d6)

| D6    | Item              | Efeito                |
|-------|-------------------|-----------------------|
| 1     | Espada Mágica     | +2 em PA              |
| 2     | Poção de Cura     | Restaura 100% PV      |
| 3     | Anel Detetor      | Evita uma armadilha   |
| 4     | Armadura Mágica   | PD aumenta para 9     |
| 5     | Ouro              | 1d6 x 1000 moedas     |
| 6     | Item Amaldiçoado  | -1d6 PV               |

### Armadilhas (1d6)

| D6 | Tipo | Dano |
|----|------|------|
| 1 | Alçapão | 1d6 |
| 2 | Chuva de Dardos | 1d6 |
| 3 | Ácido | 3d6 |
| 4 | Chuva de Flechas | 2d6 |
| 5 | Gás | 1d6 |
| 6 | Desmoronamento | MORTE |

### Inimigos (1d6)

| Tipo | PA | PD | PV |
|------|----|----|------|
| Aranha Gigante | 2d6 | 7 | 15 |
| Morto Vivo | 2d6 | 5 | 8 |
| Fantasma | 2d6 | 9 | 10 |
| Orco | 2d6 | 6 | 7 |
| Troll | 2d6 | 8 | 14 |
| Guerreiro do Caos | 2d6 | 9 | 12 |

### Tabela de Saída (após 30 turnos - 1d6)

| D6 | Resultado |
|----|-----------|
| 1 | Encontro surpresa → combate obrigatório |
| 2 | **VITÓRIA!** Você escapou! |
| 3 | Queda → -1d6 PV → rolar novamente |
| 4 | Pedra bloqueia o caminho → rolar novamente |
| 5 | Esqueleto guardião → teste par/ímpar para passar |
| 6 | Desespero → precisa de 1-3 em 1d6 para sair |

## 🛠️ Compilação Manual

Se preferir compilar sem o script:

```bash
# Compilar
make -C . rom

# Limpar artefatos de build
make -C . clean

# Remover tudo gerado
make -C . distclean
```

### 📏 Padding Automático do ROM e Conversão HEX → BIN

O ROM passa por dois processos automáticos durante a compilação:

#### 1. **Conversão HEX para Binário**

O SDCC gera ROMs em formato **Intel HEX** (texto ASCII, ex: `:03000000C300013...`), mas o OpenMSX e hardware MSX exigem **formato binário** (.bin/.rom).

O script `pad-rom.sh` detecta automaticamente o formato HEX e converte para binário usando:
- `objcopy -I ihex -O binary` (método primário)
- Fallback: `srec_cat` ou `packihx` se objcopy não estiver disponível

**Exemplo de conversão:**
```
HEX (texto):   20,678 bytes
↓ (objcopy)
BIN (binário): 41,357 bytes  
```

#### 2. **Padding para Múltiplo de 8 KB**

Após conversão para binário, o ROM é expandido para o múltiplo de 8 KB mais próximo:

- ROM de 41,357 bytes → **49,152 bytes** (48 KB = 6 × 8 KB)
- Padding usa bytes zero (0x00)
- OpenMSX aceita o tamanho sem avisos

**Processo automático completo:**
```bash
make rom  # Compila SDCC → HEX → BIN → Padding → ROM pronto
```

Para executar manualmente:

```bash
./pad-rom.sh
```

**Verificar formato da ROM:**

```bash
file rom/fortaleza.rom
# Deverá mostrar: "data" (binário, não texto)

hexdump -C rom/fortaleza.rom | head -2
# Deve mostrar bytes hexadecimais, não caracteres ASCII
```

## 📦 Estrutura do Código

### main.c

Programa principal com loop de jogo e gerenciamento de estados.

**Estados do Jogo:**

- `GAME_MENU` - Menu principal
- `GAME_CHARACTER_CREATION` - Criação de personagem
- `GAME_EXPLORATION` - Loop de exploração
- `GAME_HELP` - Tela de ajuda
- `GAME_OVER` - Fim de jogo

### game.h / game.c

Estruturas de dados e lógica principal do jogo:

- `Player_t` - Stats e inventário do jogador
- `Enemy_t` - Stats dos inimigos
- `Game_State` - Estado geral do jogo
- `roll_dice()` - Rolagem de dados
- `random_range()` - Número aleatório em intervalo

### ui.h / ui.c

Funções de interface de usuário:

- `Print_Clear()` - Limpa tela
- `Print_At()` - Imprime texto em posição (x, y)
- `Print_String()` - Imprime string
- `Print_Int()` - Imprime inteiro
- `Print_Char()` - Imprime caractere
- `Print_GetChar()` - Lê entrada do teclado
- `Print_Box()` - Desenha caixa
- `Print_HLine()` / `Print_VLine()` - Desenha linhas

## 🐛 Troubleshooting

### ROM não carrega no OpenMSX ("Cartridge not found")

**Causa 1: ROM está em formato HEX (texto), não binário**

```bash
# Verificar formato
file rom/fortaleza.rom

# Se mostrar "ASCII text" → é HEX, deve ser convertido
# Se mostrar "data" → é binário ✓
```

**Solução:**
```bash
# Recompilar com conversão automática
make clean rom
```

**Causa 2: Flatpak sem permissão de arquivo**

```bash
# Verificar se Flatpak tem acesso ao sistema de arquivos
flatpak run --filesystem=host org.openmsx.openMSX -cart "$(pwd)/rom/fortaleza.rom"
```

**Solução:**
```bash
# make.sh já usa --filesystem=host, mas se usar manualmente:
./make.sh run
```

**Causa 3: ROM não é múltiplo de 8 KB**

```bash
# Verificar tamanho (deve ser divisível por 8192)
ls -l rom/fortaleza.rom
stat rom/fortaleza.rom | grep Size

# Deve ser: 8192, 16384, 24576, 32768, 40960, 49152, etc.
```

**Solução:**
```bash
./pad-rom.sh  # Adiciona padding automaticamente
```

### OpenMSX não abre

```bash
# Verificar se OpenMSX está instalado
flatpak list --app | grep OpenMSX

# Instalar manualmente se necessário
flatpak install flathub org.openmsx.openMSX
```

### SDCC não encontrado

```bash
# Verificar instalação
which sdcc
sdcc --version

# Instalar se necessário (Ubuntu)
sudo apt-get install sdcc
```

### Erro de compilação

```bash
# Limpar e recompilar
./make.sh clean
./make.sh compile
```

## 📝 Notas Técnicas

### Formato do ROM

O ROM passa por 3 formatos:

1. **Intel HEX** (gerado pelo SDCC)
   - Formato: Texto ASCII
   - Exemplo: `:03000000C300013...`
   - Tamanho: ~20 KB (texto é ineficiente)
   - Uso: Intermediário apenas

2. **Binary (Binário)**
   - Formato: Dados brutos Z80
   - Estrutura: Código executável Z80 @ 0x8000
   - Tamanho: ~41 KB (conteúdo comprimido)
   - Uso: Carregado pelo emulador

3. **ROM Padded**
   - Tamanho: Múltiplo de 8 KB (ex: 49,152 bytes)
   - Padding: Bytes zero (0x00) no final
   - Requisito: Necessário para hardware MSX
   - Arquivo final: `rom/fortaleza.rom`

### Limitações MSX1

- ROM máxima: 64 KB
- RAM disponível: ~16 KB para programas
- Resolução: 40x24 caracteres (modo texto)
- Z80 @ 3.5 MHz

### MSXgl

A biblioteca MSXgl fornece:

- Gerenciamento de vídeo
- Entrada de teclado
- Funções gráficas básicas
- Timer e temporização

## 🎓 Extensões Futuras

- [ ] Sistema de salvamento em disco
- [ ] Geração procedural visual do mapa
- [ ] Som e efeitos de áudio
- [ ] Múltiplos níveis de dificuldade
- [ ] Ranking de melhores pontuações
- [ ] Imagem de disquete (.DSK)
- [ ] Suporte a mouse

## 📚 Referências

- [SDCC - Small Device C Compiler](https://sdcc.sourceforge.net/)
- [MSXgl - MSX Graphics Library](https://github.com/aoineko-fr/MSXgl)
- [OpenMSX - MSX Emulator](https://openmsx.org/)
- [MSX Wiki](https://www.msx.org/)

## 👨‍💻 Desenvolvimento

Para desenvolvedores que querem modificar o jogo:

```bash
# Editar código
nano src/main.c

# Recompilar
./make.sh compile

# Testar
./make.sh run
```

## 📄 Licença

Este projeto é uma implementação digital do jogo "A Fortaleza de Berdolock"
originalmente publicado por Riachuelo Games.

---

## Desenvolvido com ❤️ para MSX**

## Última atualização: Maio 2026*
