//
// Fusion-C
// My First Program in C
//

#include "fusion-c/header/msx_fusion.h"

void main(void) 
{
  char c,*frase;
  Print("Teste de compilacao!\n");
  PrintNumber(100);
  Print("\n");
  PrintFNumber(100,48,5);
  Print("\n");
  PrintChar(60);
  PrintChar('<');
  PrintDec(-125);
  Print("\n");
  Print("Digite um caracter:");
  c = InputChar();
  Print("\nVoce digitou=>");
  PrintChar(c);
  Print("Digite uma palavra de oito letras:");
  InputString(frase,8);
  PrintString(frase);
}