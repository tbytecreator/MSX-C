#include <stdio.h>
#include <stdlib.h>

int RecebeNumero(void)
{
    int numero;
    printf("Digite um numero decimal:");
    scanf("%d",&numero);
    return numero;
}

int CalculaProdutoVetorial(int *vetor1,int *vetor2, int tamanho)
{
    int i;
    int produto=0;
    for(i=0;i<tamanho;i++)
    {
        produto+=vetor1[i]*vetor2[i];
    }
    return produto;
}

void main(void)
{
    int vetor1[5];
    int vetor2[5];
    int resultado,i;

    for(i=0;i<5;i++)
    {
        vetor1[i]=RecebeNumero();
        vetor2[i]=RecebeNumero();
    }
    
    resultado = CalculaProdutoVetorial(vetor1, vetor2, 5);
    printf("O produto vetorial e: %d",resultado);
}