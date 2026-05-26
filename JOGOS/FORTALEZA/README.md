# 🎮 Fortaleza de Berdolock

MSX Adventure Game em C | Compilado com SDCC | Testado em OpenMSX**

## 📚 Documentação

Toda a documentação foi movida para a pasta `docs/`. Consulte:

- **[docs/WELCOME.md](docs/WELCOME.md)** ⭐ **START HERE** - Bem-vindas e guia rápido
- **[docs/MSXGL_INTEGRATION.md](docs/MSXGL_INTEGRATION.md)** - Integração com MSXgl (NEW)
- **[docs/README.md](docs/README.md)** - Documentação completa (compilação, gameplay, troubleshooting)
- **[docs/QUICKSTART.md](docs/QUICKSTART.md)** - 5 minutos para começar
- **[docs/GAMEPLAY.md](docs/GAMEPLAY.md)** - Mecânicas completas do jogo
- **[docs/DOCUMENTATION_INDEX.md](docs/DOCUMENTATION_INDEX.md)** - Índice navegável de toda documentação

## 🚀 Quick Start

```bash
cd ~/Dev/tbc/MSX-C/JOGOS/FORTALEZA
./make.sh build     # Compila e abre OpenMSX com o jogo
```

## 📂 Estrutura do Projeto

```ascii
FORTALEZA/
├── src/              # Código fonte (850+ linhas)
├── rom/              # ROM compilada (49 KB)
├── docs/             # Documentação completa (13 arquivos)
├── Makefile          # Build system
├── make.sh           # Script automatizado
├── pad-rom.sh        # ROM processing
├── verify-rom.sh     # ROM verification
└── ...scripts e assets
```

## ✅ Status

**FUNCIONAL E PRONTO PARA JOGAR** ✓

- ✓ Jogo completo implementado
- ✓ Build system automático
- ✓ ROM compilada e testada
- ✓ Documentação profissional
- ✓ Todas as dependências verificadas

## 🎮 Como Jogar

1. Execute: `./make.sh build`
2. Aguarde OpenMSX abrir
3. Explore a masmorra em 30 turnos
4. Sobreviva ao combate e colete tesouros!

---

**Para mais informações**, abra: [`docs/WELCOME.md`](docs/WELCOME.md)
