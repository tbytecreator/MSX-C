# include <stdio.h>
# include <stdlib.h>
#include "fusion-c/header/msx_fusion.h"

void main(void) 
{
    char buffer[6];
    int numero;

    Print("Digite um numero: ");
    InputString(buffer,6);
    numero = atoi(buffer); // Convert string to integer

    if (numero > 0) 
    {
        Print("O numero e positivo.\n");
    }
    else if (numero < 0) 
    {
        Print("O numero e negativo.\n");
        PrintNumber(numero); // Assuming PrintNumber is defined to print integers
    }
    else 
    {
        Print("O numero e zero.\n");
    }

    Print("\nPressione uma tecla para sair...");
    WaitKey();
}