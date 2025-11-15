# include <stdio.h>
# include <stdlib.h>
# include "fusion-c/header/msx_fusion.h"

int lenumero()
{
    char buffer[10];
    int numero;  
    // Exibe mensagem
    Print("\nDigite um numero: ");
    // Lê a string
    InputString(buffer, 10);
    // Converte string para inteiro
    numero = atoi(buffer);
    return numero;
}

void main(void)
{
    int numero; 
    // Limpa a tela
    Screen(0);
   
    // para loops determinados
    // for(int contador=0;contador<5;contador++)
    // {
    //     numero = lenumero();
    //      // Usa o número
    //     Print("\nVoce digitou: ");
    //     PrintNumber(numero);
    // }

    // para loops indeterminados
    while(1)
    {
        numero = lenumero();
        // Verifica condição de saída
        if(numero==0)
        {
            break; // Sai do loop
        }
        // Usa o número
        Print("\nVoce digitou: ");
        PrintNumber(numero);
    }
}