#include "fusion-c/header/msx_fusion.h"

void ImprimeOiMUndo(void);
int SomaDoisNumeros(int a, int b);

int main(void) 
{
  ImprimeOiMUndo();
  return 0;
}

void ImprimeOiMUndo(void)
{
  Print("Oi Mundo!\n\r");
  PrintNumber(SomaDoisNumeros(3, 5));
}

int SomaDoisNumeros(int a, int b)
{
  return a + b;
} 

