// -----------------------------------
// DEMONSTRACAO DE OPERADORES EM C
// MANOEL NETO 2024-02-11
// -----------------------------------

// OS OPERADORES SAO UTILIZADOS PARA 
// REALIZAR OPERAÇÕES MATEMÁTICAS E 
// LÓGICAS EM C.

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
void aritimeticos(int a, int b)
{
    int r;
    Print("\n");

    // Adicao
    r = a + b;
    Print("Adicao:");
    PrintNumber(r);
    Print("\n");

    // Subtracao
    r = a - b;
    Print("Subtracao:");
    PrintNumber(r);
    Print("\n");

    // Multiplicacao
    r = a * b;
    Print("Multiplicacao:");
    PrintNumber(r);
    Print("\n");

    // Divisao
    r = a / b;
    Print("Divisao:");
    PrintNumber(r);
    Print("\n");

    // Resto da Divisao
    r = a % b;
    Print("Resto da Divisao:");
    PrintNumber(r);
    Print("\n");

    // Incremento
    r = a;
    r++;
    Print("Incremento:");
    PrintNumber(r);
    Print("\n");

    // Decremento
    r = a;
    r--;
    Print("Decremento:");
    PrintNumber(r);
    Print("\n");
}

// OPERADORES RELACIONAIS
// ==	IGUAL
// !=	DIFER
// >	MAIOR
// <	MENOR
// >=	MAIOR OU IGUAL
// <=	MENOR OU IGUAL
void relacionais(int a, int b)
{
    int r;
    Print("\n");

    // Igual
    r = a == b;
    Print("Igual:");
    PrintNumber(r);
    Print("\n");

    // Diferente
    r = a != b;
    Print("Diferente:");
    PrintNumber(r);
    Print("\n");

    // Maior
    r = a > b;
    Print("Maior:");
    PrintNumber(r);
    Print("\n");

    // Menor
    r = a < b;
    Print("Menor:");
    PrintNumber(r);
    Print("\n");

    // Maior ou Igual
    r = a >= b;
    Print("Maior ou Igual:");
    PrintNumber(r);
    Print("\n");

    // Menor ou Igual
    r = a <= b;
    Print("Menor ou Igual:");
    PrintNumber(r);
    Print("\n");
}

// OPERADORES LOGICOS 
// && AND => se os dois operandos não forem zero, a condição é veradeira (A && B)
// || OR  => Se qualquer um dos dois operandos não é zero, a condição é veradeira (A || B)
// !  NOT => Usado para reverter o estado do operador !(A)
void logicos()
{
    Print("\n");
    Print("Tabela verade dos operadores logicos\n");
    Print("====================================\n");

    // NOT
    Print("!0 = ");
    PrintNumber(!0);
    Print("\n");

    Print("!1 = ");
    PrintNumber(!1);
    Print("\n");

    // AND
    Print("0 && 0 = ");
    PrintNumber(0 && 0);
    Print("\n");
 
    Print("0 && 1 = ");
    PrintNumber(0 && 1);
    Print("\n");

    Print("1 && 0 = ");
    PrintNumber(1 && 0);
    Print("\n");
    
    Print("1 && 1 = ");
    PrintNumber(1 && 1);
    Print("\n");
    
    // OR
    Print("0 || 0 = ");
    PrintNumber(0 || 0);
    Print("\n");

    Print("0 || 1 = ");
    PrintNumber(0 || 1);
    Print("\n");

    Print("1 || 0 = ");
    PrintNumber(1 || 0);
    Print("\n");

    Print("1 || 1 = ");
    PrintNumber(1 || 1);
    Print("\n");

}

void main(void)
{
    int a = 10;
    int b = 5;

    // testa os operadores aritimeticos
    aritimeticos(a,b);

    // testa os operadores relacionais
    relacionais(a,b);

    // testa os operadores logicos
    logicos();
}
