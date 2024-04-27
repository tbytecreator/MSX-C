// -----------------------------------
// DEMONSTRACAO DOS OP ARITIMETICOS
// MANOEL NETO 2024-02-14 
// -----------------------------------

// OS OPERADORES ARITIMETICOS SAO 
// UTILIZADOS PARA REALIZAR 
// OPERAÇÕES MATEMATICAS

#include <stdio.h>
#include "fusion-c/header/msx_fusion.h"

// OPERADORES ARITMETICOS
// +	ADICAO
// −	SUBTRACAO 
// *	MULTIPLICACAO
// /	DIVISAO 
// %	RESTO DA DIVISAO 
// ++	INCREMENTO
// --	DECREMENTO 

void  aritimeticos(int a,int b)
{
    int r; // mantem os resultados
    
    r = a + b;
    Print("Soma:");
    PrintNumber(r);

    r = a - b;
    Print("Subtracao:");
    PrintNumber(r);

    r = a * b;
    Print("Multiplicacao:");
    PrintNumber(r);

    r = a / b;
    Print("Divisao:");
    PrintNumber(r);

    r = a % b;
    Print("Resto:");
    PrintNumber(r);

    r = a;
    r++;
    Print("Incremento:");
    PrintNumber(r);

    r = a;
    r--;
    Print("Decremento:");
    PrintNumber(r);

}

void main(void)
{
    int a = 10;
    int b = 5;
    aritimeticos(a,b);
    Exit(0);
}



