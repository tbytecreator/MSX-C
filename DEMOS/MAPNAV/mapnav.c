// ------------------------------------
// Exemplo de movimentação em um mapa
// Manoel Neto 2024-11-26
// ------------------------------------
#include <stdio.h>
#include "fusion-c/header/msx_fusion.h"

int mapaLabirinto[5][4];
int salaAtual = 0;

void ImprimeMapaLabirinto()
{
  int i, j;
  Print("Mapa do Labirinto\n");
  Print("====================================\n");
  for (i = 0; i < 5; i++)
  {
    for (j = 0; j < 4; j++)
    {
      PrintNumber(mapaLabirinto[i][j]);
      Print(" ");
    }
    Print("\n");
  }
  Print("====================================\n");
  Print("\n");
}

void CarregarMapa()
{
  // sala 1 
  mapaLabirinto[0][0] = 1;   //norte
  mapaLabirinto[0][1] = 255; //sul
  mapaLabirinto[0][2] = 255; //leste
  mapaLabirinto[0][3] = 255; //oeste

  // sala 2
  mapaLabirinto[1][0] = 3; //norte
  mapaLabirinto[1][1] = 0; //sul
  mapaLabirinto[1][2] = 4; //leste 
  mapaLabirinto[1][3] = 2; //oeste

  // sala 3
  mapaLabirinto[2][0] = 255; //norte
  mapaLabirinto[2][1] = 255; //sul
  mapaLabirinto[2][2] = 1; //leste
  mapaLabirinto[2][3] = 255; //oeste

  // sala 4
  mapaLabirinto[3][0] = 255; //norte
  mapaLabirinto[3][1] = 1; //sul
  mapaLabirinto[3][2] = 255; //leste
  mapaLabirinto[3][3] = 255; //oeste

  // sala 5
  mapaLabirinto[4][0] = 255; //norte
  mapaLabirinto[4][1] = 255; //sul
  mapaLabirinto[4][2] = 255; //leste
  mapaLabirinto[4][3] = 1; //oeste
}

// recebe o verbo do jogador
char ReceberVerbo()
{
  char verbo[2];
  Print("Voce esta na sala ");PrintNumber(salaAtual);Print("\n");
  Print("Para onde deseja ir?\n");
  Print("====================================\n");
  if (mapaLabirinto[salaAtual][0] != 255) Print("(n)orte\n");
  if (mapaLabirinto[salaAtual][1] != 255) Print("(s)ul\n");
  if (mapaLabirinto[salaAtual][2] != 255) Print("(l)este\n");
  if (mapaLabirinto[salaAtual][3] != 255) Print("(o)este\n");
  Print("(a)bandonar o labirinto\n");
  Print("====================================\n");
  Print(">");
  InputString(verbo,1);
  if (verbo[0] == 'n' && mapaLabirinto[salaAtual][0] != 255) return 'n';
  if (verbo[0] == 's' && mapaLabirinto[salaAtual][1] != 255) return 's';
  if (verbo[0] == 'l' && mapaLabirinto[salaAtual][2] != 255) return 'l';
  if (verbo[0] == 'o' && mapaLabirinto[salaAtual][3] != 255) return 'o';
  if (verbo[0] == 'a') return 'a';
  return 'i';
}

// processa o verbo do jogador
void ProcessarVerbo(char verboAtual)
{
  if (verboAtual == 'n') salaAtual = mapaLabirinto[salaAtual][0];
  if (verboAtual == 's') salaAtual = mapaLabirinto[salaAtual][1];
  if (verboAtual == 'l') salaAtual = mapaLabirinto[salaAtual][2];
  if (verboAtual == 'o') salaAtual = mapaLabirinto[salaAtual][3];
}

//Função principal
int main(void) 
{
  CarregarMapa();
  //ImprimeMapaLabirinto();
  char verboAtual = 'i';

  while(verboAtual != 'a')
  {
    verboAtual = ReceberVerbo();
    if (verboAtual == 'i')
    {
      Print("Este verbo nao existe.\n");
    }
    else
    {
      ProcessarVerbo(verboAtual);
    }
  }
  Print("Voce abandonou o labirinto.\n");
}