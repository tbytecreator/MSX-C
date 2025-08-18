# include <stdio.h>
# include <stdlib.h>
#include "fusion-c/header/msx_fusion.h"

void positivoNegativo(int numero);
{
    if (numero > 0) 
    {
        Print("O numero e positivo.\n");
    }
    else if (numero < 0) 
    {
        Print("O numero e negativo.\n");
    }
    else 
    {
        Print("O numero e zero.\n");
    }
    return
}

void testeswitch(int numero);
{
    switch(numero)
    {
        case 0:
            Print("O numero e zero.\n");
            break;
        case 1:
            Print("O numero e um.\n");
            break;
        case 2:
            Print("O numero e dois.\n");
            break;
        case 3:
            Print("O numero e tres.\n");
            break;
        case 4:
            Print("O numero e quatro.\n");
            break;
        case 5:
            Print("O numero e cinco.\n");
            break;
        default:
            Print("Numero fora do intervalo de 0 a 5.\n");
            break;
    }
    return;
}

void main(void) 
{
    char buffer[6];
    int numero;

    Print("Digite um numero: ");
    InputString(buffer,6);
    numero = atoi(buffer); // Convert string to integer

    positivoNegativo(numero);
    testeswitch(numero);

    Print("\nPressione uma tecla para sair...");
    WaitKey();
}