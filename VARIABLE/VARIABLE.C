/* 
----------------------------------
EXEMPLO DE VARIAVEIS EM C
----------------------------------
*/
#include "fusion-c/header/msx_fusion.h"
#include <stdio.h>
#include <limits.h>
#include <float.h>

/*
----------------------------------
OS TIPOS DO C SE DIVIDEM EM DOIS
. FUNCTION TYPES
. OBJECT TYPES 
OBJETO NO C ANSI SIGNIFICA UMA 
PARTE DA MEMORIA NO AMBIENTE DE 
EXECUCAO QUE REPRESENTA UM VALOR.
QUANDO UM OBJETO E REFERENCIADO 
CONSIDERA-SE QUE ELE TEM UM TIPO
(TIPAGEM). NO C, UMA VARIAVEL E 
UM EXEMPLO DE OBJETO
----------------------------------
*/

/*
-------- Tipos basicos -----------
Os tipos basicos são tipos 
aritimeticos e se classificam em 
inteiros e de ponto flutuante
----------------------------------
*/

//------------------------------------------------------------------------------------------
// Tipos Inteiros  
//------------------------------------------------------------------------------------------
char caracter;                             //1 byte 
unsigned char caracterSemSinal;            //1 byte (0 a 255)
signed char caracterComSinal;              //1 byte (-128 ate 127)
int numeroInteiro;                         //2 ou 4 bytes 
unsigned int inteiroSemSinal;              //2 ou 4 bytes (-32768 ate 32767) 
short inteiroDeDoisBytes;                  //2 bytes (-32768 ate 32767)
unsigned short inteiroDeDoisBytesSemSinal; //2 bytes (0 a 65535)
long  inteiroDeQuatroBytes;                //4 bytes (de menos 2 bilhões a mais 2 bilhões)
unsigned long inteiroDeQuatroBytesSemSinal;//4 bytes (até 4 bilhões)
//------------------------------------------------------------------------------------------

//------------------------------------------------------------------------------------------
// Tipos Ponto Flutuante   
//------------------------------------------------------------------------------------------
float precisaoSimples;         // 4 bytes  | 1.2E-38 a 3.4E+38     | 6 casas decimais
// para usar os tipos abaixo, compilar com a opção "model-Large"
//double precisaoDupla;        // 8 bytes  | 2.3E-308 a 1.7E+308   | 15 casas decimais
//long double precisaoLonga;   // 10 bytes | 3.4E-4932 a 1.1E+4932 | 19 casas decimais
//------------------------------------------------------------------------------------------
 
void ImprimirValores(void)
{
  float fltMax = FLT_MAX;

  Print("Valores Maximos");Print("\n");
  Print("------------------------");Print("\n");
  PrintNumber(fltMax);
  printf("FLT_MIN     :   %g\n", (float) FLT_MIN);
  printf("-FLT_MAX    :   %g\n", (float) -FLT_MAX);
  printf("-FLT_MIN    :   %g\n", (float) -FLT_MIN);
  Print("------------------------");Print("\n");
}

int main(void) 
{ 
  // Tipos Inteiros
  Print("Tipos Inteiros");Print("\n");
  Print("------------------------");;Print("\n");
  Print("caracter:");PrintNumber(sizeof(caracter));Print("\n");
  Print("caracterSemSinal:");PrintNumber(sizeof(caracterSemSinal));Print("\n");
  Print("caracterComSinal:");PrintNumber(sizeof(caracterComSinal));Print("\n");
  Print("numeroInteiro:");PrintNumber(sizeof(numeroInteiro));Print("\n");
  Print("inteiroSemSinal:");PrintNumber(sizeof(inteiroSemSinal));Print("\n");
  Print("inteiroDeDoisBytes:");PrintNumber(sizeof(inteiroDeDoisBytes));Print("\n");
  Print("inteiroDeDoisBytesSemSinal:");PrintNumber(sizeof(inteiroDeDoisBytesSemSinal));Print("\n");
  Print("inteiroDeQuatroBytes:");PrintNumber(sizeof(inteiroDeQuatroBytes));Print("\n");
  Print("inteiroDeQuatroBytesSemSinal:");PrintNumber(sizeof(inteiroDeQuatroBytesSemSinal));Print("\n");
  Print("------------------------");Print("\n");
  Print("\n");
  // Tipos Ponto Flutuante
  Print("Tipos Ponto Flutuante");Print("\n");
  Print("------------------------");Print("\n");
  Print("precisaoSimples:");PrintNumber(sizeof(precisaoSimples));Print("\n");
  Print("\n");
  ImprimirValores();
  return 0; 
}