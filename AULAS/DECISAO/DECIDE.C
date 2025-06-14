// -----------------------------------
// DEMONSTRACAO DE ESTRUTURAS DE 
// DECISAO EM C 
// MANOEL NETO 2025-06-14
// -----------------------------------

#include <stdio.h>
#include <stdlib.h>
#include "fusion-c/header/msx_fusion.h"

void main(void)
{
    char buffer[6]; // Buffer para até 5 dígitos + '\0'
    int numero;
    Print("Digite um numero: ");
    InputString(buffer, 6); // Lê string do teclado
    numero = atoi(buffer); // Converte string para inteiro
    Print("Voce digitou: ");
    PrintNumber(numero);
    Print("\n");
    if (numero < 0)
    {
        Print("O numero eh negativo.\n");
    }
    else if (numero == 0)
    {
        Print("O numero eh zero.\n");
    }
    else
    {
        Print("O numero eh positivo.\n");
    }
    WaitForKey();
}
