# Fortaleza

Fortaleza é um jogo escrito em MSX C, usando a biblioteca MSXgl. O jogo vai replicar as mecânicas do jogo "A Fortaleza de Berdolock", que está definido no arquivo "fortaleza.pdf". O jogo deve seguir os moldes de um jogo de aventura dos anos 70, onde o jogo oferece uma texto e um prompt, onde o jogador pode entrar suas ações por um sistema de verbos definidos pelo jogo.

## Ferramentas de desenvolvimento

- Compilador SDCC <https://sdcc.sourceforge.net/>
- Biblioteca MSXgl <https://github.com/aoineko-fr/MSXgl>

Crie um script que verifique se todas as ferramentas estão instaladas, e se não estiverem, instale as ferramentas e suas dependencias.

## Requisitos técnicos

- Criar o ambiente de desenvolvimento MSX C e MSXgl na pasta principal do projeto.

- Colocar todos os códigos fonte na pasta "src".

- Colocar todos os documentos de desenvolvimento na pasta "docs".

- Criar um script que compile o jogo no formato ROM (máximo de 64Kbytes) para a arquitetura MSX 1. O arquivo resultado da compilação deve ser colocado na pasta "rom"

- Criar um script para compilar o jogo no formato disquete (.DSK). O arquivo resultado da compilação deve ser uma imagem .DSK para a arquitetura MSX 1, e deve ser colocado na pasta "dsk"

- Os scripts que compilam o projeto devem estar na pasta raiz do projeto.

- Leia o pdf "fortaleza.pdf" para as definições do jogo. O jogo deve ser uma réplica digital do jogo em pdf.

- O jogo deve ter um verbo de ajuda, que mostra todos os verbos possíveis de serem digitados pelo jogador.
