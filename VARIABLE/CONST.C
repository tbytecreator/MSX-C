// ----------------------------------
// EXEMPLO DE CONSTANTES EM C
// ----------------------------------
#include <stdlib.h>
#include <stdio.h>
#include "fusion-c/header/msx_fusion.h"
// ----------------------------------
// Definindo as constantes
// existem duas maneiras fáceis de se 
// definir uma constante 
// usando a diretiva de 
// preprocessador #define
// ----------------------------------
#define SC2LINHAS 191   
#define SC2COLUNAS 255  
#define NEWLINE "\n"

int main() 
{
    // ----------------------------------
    // Ou usando a palavra reservada 
    // const 
    // ----------------------------------
    const int SC0LINHAS = 32;
    const int SC0COLUNAS = 40;
    int areaSC0,areaSC2;  
  
    areaSC0 = SC0LINHAS * SC0COLUNAS;
    Print("Valor da area SC0: ");
    PrintNumber(areaSC0);
    Print(NEWLINE);

    areaSC2 = SC2LINHAS * SC2COLUNAS;
    Print("Valor da area SC2: ");
    PrintNumber(areaSC2);
    Print(NEWLINE);

    return 0;
}