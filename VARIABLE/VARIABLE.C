/* 
----------------------------------
EXEMPLO DE VARIAVEIS EM C
----------------------------------
*/
#include "fusion-c/header/msx_fusion.h"


/*
----------------------------------
OS TIPOS DO C SE DIVIDEM EM DOIS
. FUNCTION TYPES
. OBJECT TYPES 
OBJETO NO C ANSI SIGNIFICA UMA 
PARTE DA MEMORIA NO AMBIENTE DE 
EXECUCAO QUE REPRESENTA UM VALOR
QUANDO UM OBJETO E REFERENCIADO 
CONSIDERA-SE QUE ELE TEM UM TIPO
(TIPAGEM). NO C, UMA VARIAVEL E 
UM EXEMPLO DE OBJETO
----------------------------------
*/



/*
----------------------------------
FUNCOES EM C NAO SAO OBJETO MAS 
POSSUEM TIPOS.UM TIPO DE FUNCAO EH 
CARACTERIZADO PELO SEU VALOR DE 
RETORNO EM CONJUNTO COM O NUMERO DE
PARAMETROS E OS TIPOS DOS 
PARAMETEROS, A ISSO DAMOS O NOME 
DE ASSINATURA DA FUNCAO
----------------------------------  
*/
void swap(int a, int b) 
{ 
  int t = a; 
  a = b; 
  b = t; 
  Print("Troca:\n");
  Print("a=");
  PrintNumber(a);
  Print("\nb=");
  PrintNumber(b);
  Print("\n");
}

int main(void) 
{ 
  int a = 21; 
  int b = 17;
  swap(a, b); 
  Print("Principal:\n");
  Print("a=");
  PrintNumber(a);
  Print("\nb="); 
  PrintNumber(b);
  Print("\n");
  return 0; 
}