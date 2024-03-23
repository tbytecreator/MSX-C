// ========================
// SENHOR DAS TREVAS MSX
// UM JOGO EM FUSION - C 
// POR MANOEL NETO
// ========================

#include "fusion-c/header/msx_fusion.h"
#include "fusion-c/header/vdp_graph1.h"
#include "fusion-c/header/vdp_sprites.h"
#include "assets/PTBR.H"
#include "assets/SPRITES.H"

// Definição dos endereços de memória
#define JIFFY (*(char *)0xfc9e)

// Definição das variáveis globais
int intMsxType,intBordaSuperior,intBordaInferior;
int intXColisao,intYColisao;
int intPosXCanhao,intPosYCanhao,intVelCanhao;
int intPosXAlien,intPosYAlien,intVelXAlien,intVelYAlien,intNumAliens;
int intPosXTorpedo,intPosYTorpedo,intNumTorpedos,intVelTorpedo;
int intNivel,i,j;
int intAliens[8][2];
char chrOpcao;
unsigned int lastJiffy;

void LoadSpritesTable()
{
    SetSpritePattern(0,Canhao,8);
    SetSpritePattern(1,Torpedo,8);
    SetSpritePattern(2,Alien,8);
}

void DesenharCanhao()
{
    PutSprite(8,0,intPosXCanhao,intPosYCanhao,8);
}

void DesenharTorpedo()
{
    PutSprite(9,1,intPosXTorpedo,intPosYTorpedo,8);
}

void DesenharAlien(int intAlien,int x,int y)
{
    PutSprite(intAlien,2,x,y,2);
}

void MoverAliens()
{
    for(i=0;i<8;i++)
    {   
        // checa a borda horizontal esquerda
        if(intAliens[i][0] < 16)
        {
            intVelXAlien = intVelXAlien*-1;
            intAliens[i][0] = 16;
        }

        // checa a borda horizontal direita
        if(intAliens[i][0] > 239)
        {
            intVelXAlien = intVelXAlien*-1;
            intAliens[i][0] = 239;
        } 

        // checa a borda vertical superior
        if(intAliens[i][1]<intBordaSuperior)
        {
            intVelYAlien = intVelYAlien*-1;
            intAliens[i][1]=intBordaSuperior;
        }

        // checa a borda vertical inferior
        if(intAliens[i][1]>intBordaInferior)
        {
            intVelYAlien = intVelYAlien*-1;
            intAliens[i][1]=intBordaInferior;
        } 

        intAliens[i][0] = intAliens[i][0]+intVelXAlien;
        intAliens[i][1] = intAliens[i][1]+intVelYAlien;
    }
}

void RemoverTorpedo()
{
    intNumTorpedos=0;
}

void CriarTorpedo()
{
    if(intNumTorpedos==0)
    {
        intPosXTorpedo=intPosXCanhao;
        intPosYTorpedo=intPosYCanhao-2;
        intNumTorpedos++;
    }
}

void MoverTorpedo()
{
    if(intNumTorpedos==1)
    {
        intPosYTorpedo=intPosYTorpedo-intVelTorpedo;
        if(intPosYTorpedo<=2) RemoverTorpedo();
    }
}

void PegarComandos()
{
    int intMove=JoystickRead(0);
    int intFire=TriggerRead(0);
    switch (intMove)
    {
        case 2:
            /* up & right */
            intPosXCanhao=intPosXCanhao+intVelCanhao;
        break;
        case 3:
            /* right */
            intPosXCanhao=intPosXCanhao+intVelCanhao;
        break;
        case 4:
            /* down & right */
            intPosXCanhao=intPosXCanhao+intVelCanhao;
        break;
        case 6:
            /* down & left */
            intPosXCanhao=intPosXCanhao-intVelCanhao;
        break;
        case 7:
            /* left */
            intPosXCanhao=intPosXCanhao-intVelCanhao;
        break;
        case 8:
            /* up & left */
            intPosXCanhao=intPosXCanhao-intVelCanhao;
        break;
    }
    if(intPosXCanhao<=1) intPosXCanhao=1;
    if(intPosXCanhao>=228) intPosXCanhao=228;
    if(intFire==255 && intNumTorpedos==0) CriarTorpedo();
}

void CriarAliens()
{
    // criar os 8 alienigenas do jogo
    // sprites de 0 a 7  
    for(i=0;i<8;i++)
    {
        // a posicao x do alien 
        intAliens[i][0]=intPosXAlien+16*i;

        // a posicao y do alien
        if(i%2==0)
        {
            intAliens[i][1]=intPosYAlien+6;
        }
        else 
        {
            intAliens[i][1]=intPosYAlien-6;
        }
        
        // adiciona um alien na contagem
        intNumAliens++;
    }
}

void TelaInicial()
{
    VDP60Hz();
    // 256 x 192
    Screen(2);
    //branco, preto, preto
    SetColors(15,1,1);
    Cls(); 
    SpriteReset();
    LoadSpritesTable();
    SpriteOn();
    Sprite8();
    SpriteDouble();
    CriarAliens();
}

void initializeGame() 
{
    intBordaInferior=80;
    intBordaSuperior=16;
    intPosXCanhao=128;
    intPosYCanhao=176;
    intVelCanhao=2;
    intVelXAlien=1;
    intVelYAlien=10;
    intPosXAlien=105;
    intPosYAlien=60;
    intVelTorpedo=2;
    intNivel=1;
    intNumAliens=0;
    intNumTorpedos=0;
    intMsxType=ReadMSXtype();

    // Tela Inicial
    TelaInicial(); 
}

void updateGame() 
{
    // Atualizar a posição do inimigo
    MoverAliens();
    
    // Atualizar a posição do torpedo 
    MoverTorpedo(); 
}

void drawGame() 
{
    DesenharCanhao();
    DesenharTorpedo();
    for(i=0;i<8;i++)
    {
        DesenharAlien(i,intAliens[i][0],intAliens[i][1]);
    }
}

void main(void) 
{  
	// Inicializar o jogo
    initializeGame();

    // Game Loop
    while(1)
    {
        // Aguardar o próximo jiffy
        while (Peekw(JIFFY) == lastJiffy) {}
        // Pegar os comandos do jogador
        PegarComandos();
         // Atualizar posição dos elementos do jogo
        updateGame();
        // Desenhar os elementos do jogo na tela
        drawGame();
        // Atulizar o contador de jiffies
       lastJiffy = Peekw(JIFFY);
    }
}