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

// OPERADORES BITWISE
// &	AND
// |	OR
// ^	XOR
// ~	NOT
// <<	SHIFT LEFT
// >>	SHIFT RIGHT
void bitwise()
{
    Print("\n");
    Print("Tabela verade dos operadores bitwise\n");
    Print("====================================\n");

    // NOT
    Print("~0 = ");
    PrintNumber(~0);
    Print("\n");

    Print("~1 = ");
    PrintNumber(~1);
    Print("\n");

    // AND
    Print("0 & 0 = ");
    PrintNumber(0 & 0);
    Print("\n");
 
    Print("0 & 1 = ");
    PrintNumber(0 & 1);
    Print("\n");

    Print("1 & 0 = ");
    PrintNumber(1 & 0);
    Print("\n");
    
    Print("1 & 1 = ");
    PrintNumber(1 & 1);
    Print("\n");
    
    // OR
    Print("0 | 0 = ");
    PrintNumber(0 | 0);
    Print("\n");

    Print("0 | 1 = ");
    PrintNumber(0 | 1);
    Print("\n");

    Print("1 | 0 = ");
    PrintNumber(1 | 0);
    Print("\n");

    Print("1 | 1 = ");
    PrintNumber(1 | 1);
    Print("\n");

    // XOR
    Print("0 ^ 0 = ");
    PrintNumber(0 ^ 0);
    Print("\n");

    Print("0 ^ 1 = ");
    PrintNumber(0 ^ 1);
    Print("\n");

    Print("1 ^ 0 = ");
    PrintNumber(1 ^ 0);
    Print("\n");

    Print("1 ^ 1 = ");
    PrintNumber(1 ^ 1);
    Print("\n");

    // SHIFT LEFT
    Print("1 << 1 = ");
    PrintNumber(1 << 1);
    Print("\n");

    Print("1 << 2 = ");
    PrintNumber(1 << 2);
    Print("\n");

    // SHIFT RIGHT
    Print("1 >> 1 = ");
    PrintNumber(1 >> 1);
    Print("\n");

    Print("1 >> 2 = ");
    PrintNumber(1 >> 2);
    Print("\n");
}

// OPERADORES DE ATRIBUICAO
// =	ATRIBUICAO
// +=	ATRIBUICAO DE ADICAO
// -=	ATRIBUICAO DE SUBTRACAO
// *=	ATRIBUICAO DE MULTIPLICACAO
// /=	ATRIBUICAO DE DIVISAO
// %=	ATRIBUICAO DE RESTO DA DIVISAO
// <<=	ATRIBUICAO DE SHIFT LEFT
// >>=	ATRIBUICAO DE SHIFT RIGHT
// &=	ATRIBUICAO DE AND
// |=	ATRIBUICAO DE OR
// ^=	ATRIBUICAO DE XOR
void atribuicao(int a, int b)
{
    int r;
    Print("\n");

    // Atribuicao
    r = a;
    Print("Atribuicao:");
    PrintNumber(r);
    Print("\n");

    // Atribuicao de Adicao
    r += b;
    Print("Atribuicao de Adicao:");
    PrintNumber(r);
    Print("\n");

    // Atribuicao de Subtracao
    r -= b;
    Print("Atribuicao de Subtracao:");
    PrintNumber(r);
    Print("\n");

    // Atribuicao de Multiplicacao
    r *= b;
    Print("Atribuicao de Multiplicacao:");
    PrintNumber(r);
    Print("\n");

    // Atribuicao de Divisao
    r /= b;
    Print("Atribuicao de Divisao:");
    PrintNumber(r);
    Print("\n");

    // Atribuicao de Resto da Divisao
    r %= b;
    Print("Atribuicao de Resto da Divisao:");
    PrintNumber(r);
    Print("\n");

    // Atribuicao de Shift Left
    r <<= 1;
    Print("Atribuicao de Shift Left:");
    PrintNumber(r);
    Print("\n");

    // Atribuicao de Shift Right
    r >>= 1;
    Print("Atribuicao de Shift Right:");
    PrintNumber(r);
    Print("\n");

    // Atribuicao de AND
    r &= b;
    Print("Atribuicao de AND:");
    PrintNumber(r);
    Print("\n");

    // Atribuicao de OR
    r |= b;
    Print("Atribuicao de OR:");
    PrintNumber(r);
    Print("\n");

    // Atribuicao de XOR
    r ^= b;
    Print("Atribuicao de XOR:");
    PrintNumber(r);
    Print("\n");
}

// OPERADORES UNARIOS
// ++	INCREMENTO
// --	DECREMENTO
// +	IDENTIDADE
// -	NEGACAO
// &	ENDERECO
// *	VALOR DE
// !	NEGACAO LOGICA
// ~	NEGACAO BITWISE
void unarios(int op)
{
    int r;
    Print("\n");

    // incremento
    r = op;
    r++;
    Print("Incremento:");
    PrintNumber(r);
    Print("\n");

    // decremento
    r = op;
    r--;
    Print("Decremento:");
    PrintNumber(r);
    Print("\n");

    // identidade
    r = +op;
    Print("Identidade:");
    PrintNumber(r);
    Print("\n");

    int b = 'A';
    r = +b;
    Print("Identidade:");
    PrintNumber(r);
    Print("\n");

    //negacao
    r = -op;
    Print("Negacao:");
    PrintNumber(r);
    Print("\n");

    // endereco
    int* p = &op;
    Print("Endereco:");
    PrintNumber(*p);
    Print("\n");

    //negacao logica
   if (!(0 && 0))
   {
      Print("A Condicao agora eh verdadeira\n");
   }

}

void main(void)
{
    int a = 10;
    int b = 5;

    // testa os operadores aritimeticos
    //aritimeticos(a,b);

    // testa os operadores relacionais
    //relacionais(a,b);

    // testa os operadores logicos
    //logicos();

    // testa os operadores bitwise
    //bitwise();

    // testa os operadores de atribuicao
    //atribuicao(a, b);

    // testa os operadores unarios
    unarios(a);
}
