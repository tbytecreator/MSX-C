# include <stdio.h>
# include <stdlib.h>
# include "fusion-c/header/msx_fusion.h"

void main(void)
{
    char buffer[10];
    int numero;
    
    // Limpa a tela
    Screen(0);
    
    // Exibe mensagem
    Print("Digite um numero: ");
    
    // Lê a string
    InputString(buffer, 10);
    
    // Converte string para inteiro
    numero = atoi(buffer);
    
    // Usa o número
    Print("\nVoce digitou: ");
    PrintNumber(numero);
}