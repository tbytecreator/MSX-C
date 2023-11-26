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
#define PI 3.14 

// ----------------------------------
// Uma storage class define o escopo 
// (visibilidade) e o tempo de 
// existência de variaveis e funções
// de um programa C.
// Elas precedem o tipo que modificam
// Existem 4 tipos de storage class:
// ----------------------------------

// ----------------------------------
// auto
// ----------------------------------
// Eh a storage class padrão de todas 
// as variaáveis do C
// ----------------------------------
int mount;

// ----------------------------------
// register (registrador)
// ----------------------------------
// usada quando quermos usar um  
// registrador como armazenamento 
// no lugar da RAM 
// ----------------------------------
//register int  miles;

// ----------------------------------
// static (estatica)
// ----------------------------------
// uma variavel estatica nunca e 
// destruida ou reconstruida durante 
// a vida do aplicativo
// ----------------------------------
static int count = 5;

// ----------------------------------
// extern (externa)
// ----------------------------------
// esta variavel existe no escopo nao 
// so desse arquivo, mas tambem em 
// todos os arquivos do projeto
// ----------------------------------
extern void write_extern();

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

    count = 5;
    write_extern();

    return 0;
}