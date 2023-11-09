// ----------------------------------
// EXEMPLO DE CONSTANTES EM C
// ----------------------------------
#include <stdlib.h>
#include <stdio.h>
#include "fusion-c/header/msx_fusion.h"

#define LINHAS 191   
#define COLUNAS 255  
#define NEWLINE '\n'

int main() {
   int area;  
  
   area = LINHAS * COLUNAS;
   Print("value of area : ");
   PrintNumber(area);
   Print(NEWLINE);
   return 0;
}