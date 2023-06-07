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

int main(void) 
{ 
  PrintNumber(sizeof(caracter));
  PrintNumber(sizeof(caracterSemSinal));
  PrintNumber(sizeof(caracterComSinal));
  PrintNumber(sizeof(numeroInteiro));
  PrintNumber(sizeof(inteiroSemSinal));
  PrintNumber(sizeof(inteiroDeDoisBytes));
  PrintNumber(sizeof(inteiroDeDoisBytesSemSinal));
  PrintNumber(sizeof(inteiroDeQuatroBytes));
  PrintNumber(sizeof(inteiroDeQuatroBytesSemSinal));
  return 0; 
}