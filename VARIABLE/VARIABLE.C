// ----------------------------------
// EXEMPLO DE VARIAVEIS EM C
// ----------------------------------
#include <stdlib.h>
#include <stdio.h>
#include "fusion-c/header/msx_fusion.h"

// ----------------------------------
//  OS TIPOS DO C SE DIVIDEM EM DOIS
//  . FUNCTION TYPES
//  . OBJECT TYPES 
//  OBJETO NO C ANSI SIGNIFICA UMA 
//  PARTE DA MEMORIA NO AMBIENTE DE 
//  EXECUCAO QUE REPRESENTA UM VALOR.
//  QUANDO UM OBJETO E REFERENCIADO 
//  CONSIDERA-SE QUE ELE TEM UM TIPO
//  (TIPAGEM). NO C, UMA VARIAVEL E 
//  UM EXEMPLO DE OBJETO
//----------------------------------

//-------- Tipos basicos -------------
//  Os tipos basicos são tipos 
//  aritimeticos e se classificam em 
//  inteiros e de ponto flutuante
//------------------------------------

//------------------------------------
// O Tipo Void
//------------------------------------
// O tipo void tem 3 funções básicas 
// no C 
// 1. Funções que retornam void 
//    (procedimentos): usado como tipo
//    de retorno para funções 
//    que não devolvem um valor para 
//    seu ponto chamador.
// 2. Em funções que não possuam um 
//    argumento de chamada ou 
//    parâmetro
// 3. Ponteiros para vazio: Um 
//    ponteiro do tipo void * 
//    representa o 
//    endereço para um objeto
//    mas não para o seu tipo. 
//    Um exemplo é a função void 
//    *malloc(size_t size), que 
//    retorna um ponteiro para 
//    void que pode ser convertido 
//    para qualquer tipo de dados
//------------------------------------

void EscreveOlaMundo(void)
{
  Print("\n");
  Print("Ola Mundo!");
  Print("\n");
}

void ImprimeTiposInteiros(void)
{
  //------------------------------------------------------------------------------------------
  // Tipos Inteiros  
  //------------------------------------------------------------------------------------------
  char caracter;                             //1 byte 
  unsigned char caracterSemSinal;            //1 byte (0 a 255)
  signed char caracterComSinal;              //1 byte (-128 ate 127)
  int numeroInteiro;                         //2 ou 4 bytes 
  unsigned int inteiroSemSinal;              //2 ou 4 bytes (-32768 ate 32767) 
  short inteiroDeDoisBytes;                  //2 bytes (-32768 ate 32767)
  unsigned short inteiroDeDoisBytesSemSinal; //2 bytes (0 a 65535)
  long  inteiroDeQuatroBytes;                //4 bytes (de menos 2 bilhões a mais 2 bilhões)
  unsigned long inteiroDeQuatroBytesSemSinal;//4 bytes (até 4 bilhões)
  //------------------------------------------------------------------------------------------
  Print("\n");
  Print("Tipos Inteiros");Print("\n");
  Print("------------------------");;Print("\n");
  Print("caracter:");PrintNumber(sizeof(caracter));Print("\n");
  Print("caracterSemSinal:");PrintNumber(sizeof(caracterSemSinal));Print("\n");
  Print("caracterComSinal:");PrintNumber(sizeof(caracterComSinal));Print("\n");
  Print("numeroInteiro:");PrintNumber(sizeof(numeroInteiro));Print("\n");
  Print("inteiroSemSinal:");PrintNumber(sizeof(inteiroSemSinal));Print("\n");
  Print("inteiroDeDoisBytes:");PrintNumber(sizeof(inteiroDeDoisBytes));Print("\n");
  Print("inteiroDeDoisBytesSemSinal:");PrintNumber(sizeof(inteiroDeDoisBytesSemSinal));Print("\n");
  Print("inteiroDeQuatroBytes:");PrintNumber(sizeof(inteiroDeQuatroBytes));Print("\n");
  Print("inteiroDeQuatroBytesSemSinal:");PrintNumber(sizeof(inteiroDeQuatroBytesSemSinal));Print("\n");
  Print("------------------------");Print("\n");
}

void ImprimeTiposFlutuantes(void)
{
  //------------------------------------------------------------------------------------------
  // Tipos Ponto Flutuante   
  //------------------------------------------------------------------------------------------
  float precisaoSimples;         // 4 bytes  | 1.2E-38 a 3.4E+38     | 6 casas decimais
  // para usar os tipos abaixo, compilar com a opção "model-Large"
  // double precisaoDupla;        // 8 bytes  | 2.3E-308 a 1.7E+308   | 15 casas decimais
  // long double precisaoLonga;   // 10 bytes | 3.4E-4932 a 1.1E+4932 | 19 casas decimais
  //------------------------------------------------------------------------------------------
  Print("\n");
  Print("Tipos Ponto Flutuante");Print("\n");
  Print("------------------------");Print("\n");
  Print("precisaoSimples:");PrintNumber(sizeof(precisaoSimples));Print("\n");
  Print("------------------------");Print("\n");
}

void ImprimeLiteraisInteiros(void)
{
  //------------------------------------------------------------------------------------------
  // Uma constante literal inteira pode ser um decimal, octal ou hexadecimal  
  // Um prefixo determina a base: 0x ou 0X para hexadecimal, 0 para octal, 
  // e nada quando for decimal.
  // Ele tambem pode ter um sufixo que é uma combinação de  U e L, 
  // para sem sinal e longo, respectivamente. 
  // o sufixo pode ser maiusculo ou minusculo
  // e pode estar em qualquer ordem.
  //------------------------------------------------------------------------------------------
  int v1=212;         /* Legal */
  int v2=215u;        /* Legal */
  int v3=0xFeeL;      /* Legal */
  //int v4=078;         /* Ilegal: 8 nao eh um digito valido */
  //int v5=032UU;        /* Ilegal: vc nao pode repetir um sufixo */
  //------------------------------------------------------------------------------------------
  Print("\n");
  Print("Os Literais Inteiros");Print("\n");
  Print("------------------------");Print("\n");
  PrintNumber(v1);Print("\n");
  PrintNumber(v2);Print("\n");
  PrintNumber(v3);Print("\n");
  //PrintNumber(v4);Print("\n");
  //PrintNumber(v5);Print("\n");
  Print("------------------------");Print("\n");
}

void ImprimeLiteraisFlutuantes(void)
{
  //------------------------------------------------------------------------------------------
  // Um literal de ponto flutuante tem uma parte inteira antes do ponto decimal
  // um ponto decimal e uma parte fracionaria depois do ponto decimal.
  // O numero pode estar escrito tambem em notacao cientifica.
  // Voce pode usar os sufixos U e L 
  //------------------------------------------------------------------------------------------
  float f1 = 3.14159;         /* Legal */
  float f2 = 314159E-5L;      /* Legal */
  //float f3 = 510E;          /* Illegal: incomplete exponent */
  //float f4 = 210f;          /* Illegal: no decimal or exponent */
  //float f5 = .e55           /* Illegal: missing integer or fraction */

  Print("\n");
  Print("Os Literais Flutuantes  ");Print("\n");
  Print("------------------------");Print("\n");
  printf("Numero 1: %f",f1);Print("\n");
  printf("Numero 2: %f",f2);Print("\n");
  //PrintNumber(v3);Print("\n");
  //PrintNumber(v4);Print("\n");
  //PrintNumber(v5);Print("\n");
  Print("------------------------");Print("\n");
}

void ImprimeLiteraisCaracter(void)
{
  //----------------------------------
  // Os literais do tipo caracter são 
  // definidos entre aspas simples, 
  // exemplo 'x'. Eles podem ser 
  // guardados em uma variavel simples 
  // do tipo char. Um literal caracter 
  // pode ser um caracter comum, uma 
  // sequencia de escape ('\t'), ou 
  // um caracter universal('\u02C0')
  //----------------------------------

  //----------------------------------
  // Tabela de sequencias de escape
  //----------------------------------
  //  \\	\ 
  //  \'	' 
  //  \"	" 
  //  \?	? 
  //  \a	toca um alerta
  //  \b	Backspace
  //  \f	Alimenta o formulario
  //  \n	Nova linha
  //  \r	Retorno do carro
  //  \t	Tabulacao Horizontal
  //  \v	Tabulacao Vertical 
  //  \ooo	Codigo ASCII em Octal
  //  \xhh  Codigo ASCII em Hexa
  //----------------------------------
  
  // Variaveis
  char primeiroNome[20];
  char idade[4];
  DATE mydate;

  // Pepara a tela
  Width(40);
  Cls();

  // Pega a data de hoje
  GetDate(&mydate);
  Locate(0,0);
  Print("Data de hoje: ");
  PrintDec(mydate.year);
  PrintChar('-');
  PrintDec(mydate.month);
  PrintChar('-');
  PrintDec(mydate.day);

  // Faz a saudação
  Print("\nOla ...");
  Locate (0,3);
  Print("Qual o seu nome? ");
  
  // Strings terminam com um caracter
  // de controle
  InputString(primeiroNome,19);
  Beep();
  Print("Prazer em te conhecer ");
  Print(primeiroNome);
  Print("\nQuantos anos voce tem? ");
  InputString(idade,4);
  PrintDec(atoi(idade));
  Print("...");
  PrintChar('?');
  Print("\nVoce e velho!!\n");
  Print("imprime uma barra:\\\n");
  Print("imprime um plique:\'\n");
  Print("imprime aspas:\"\n");
  Print("imprime interrogacao:\?\n");
  Print("toca o alarme:\a\n");
  Print("faz um backspace:A\b\n");
  Print("Numero Octal:\076\n");
  Print("Numero Hexadecimal:\x3E\n");
  Print("faz tab horizontal:1\t8\n");
  Print("\n\n\n\n\n\n\n\n");
  Print("faz tab vertical:1\v8\n");
  //printf("alimenta o formulário :\t \f \n");
  //printf("faz uma nova linha    :\n");
  //printf("faz o retorno do carro:\r\n");
}

int main(void) 
{ 
  //EscreveOlaMundo();
  //ImprimeTiposInteiros();
  //ImprimeTiposFlutuantes();
  //ImprimeLiteraisInteiros();
  //ImprimeLiteraisFlutuantes();
  ImprimeLiteraisCaracter();
  return 0; 
}