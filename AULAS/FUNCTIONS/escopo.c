#include "fusion-c/header/msx_fusion.h"

// funcoes prototipos
int FuncaoTeste(int a, int b);
void ImprimeNovosNumeros(void);
void ImprimeGlobalVar(void);

// constantes 
const int numeros[5] = {1, 2, 3, 4, 5};

// variaveis globais
int globalVar = 10;

int main(void) 
{
  //VarLocal = 20;
    const int novosNumeros[5] = {numeros[0] * 2, numeros[1] * 2, numeros[2] * 2, numeros[3] * 2, numeros[4] * 2};
    globalVar = 30;
    FuncaoTeste(3, 4);
    ImprimeGlobalVar();
    ImprimeNovosNumeros();
    return 0;
}

int FuncaoTeste(int a, int b)
{
    int VarLocal = 5;
    globalVar = 40;
    return VarLocal;
} 

void ImprimeNovosNumeros(void)
{
    const int novosNumeros[5] = {numeros[0] * 2, numeros[1] * 2, numeros[2] * 2, numeros[3] * 2, numeros[4] * 2};
    for(int i = 0; i < sizeof(novosNumeros)/sizeof(novosNumeros[0]); i++)
    {
        PrintNumber(novosNumeros[i]);
        Print("\n\r");
    }
}

void ImprimeGlobalVar(void)
{
    PrintNumber(globalVar);
    Print("\n\r");
}


