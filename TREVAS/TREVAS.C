// ========================
// ALIEMINATION
// UM JOGO EM FUSION - C 
// POR MANOEL NETO
// ========================

#include <string.h>
#include "fusion-c/header/msx_fusion.h"
#include "fusion-c/header/vdp_graph2.h"
#include "fusion-c/header/vdp_sprites.h"
#include "assets/PTBR.H"
#include "assets/SPRITES.C"

int intPosXCanhao,intPosYCanhao,intVelCanhao;
int intXColisao,intYColisao;
int intVelXAlien,intVelYAlien,intNumAliens;
int intXAlienInicial,intYAlienInicial;
int intNivel,i,j;
int intPosXTorpedo,intPosYTorpedo,intNumTorpedos,intVelTorpedo;
int intMsxType;
int intAliens[8][2];
char chrOpcao;

void LoadSpritesTable()
{
    SetSpritePattern(0,Canhao,8);
    SC5SpriteColors(0,CanhaoColors);
    SetSpritePattern(1,Torpedo,8);
    SC5SpriteColors(1,TorpedoColors);
    SetSpritePattern(2,Alien,8);
    SC5SpriteColors(2,AlienColors);
}

void DesenharAlien(int intAlien,int x,int y)
{
    PutSprite(intAlien,2,x,y,15);
}

void DesenharCanhao()
{
    PutSprite(9,0,intPosXCanhao,intPosYCanhao,1);
}

void DesenharTorpedo(int x,int y)
{
    PutSprite(10,1,x,y,1);
}

void MoverAliens()
{
    for(i=1;i<8;i++)
    {
        for(j=0;j<i;j++)
        {
            if((intAliens[j][0] >= 247)||(intAliens[j][0] <= 8)) intVelXAlien = intVelXAlien*-1;
            if((intAliens[j][1] >= 181)||(intAliens[j][1] <= 8)) intVelYAlien = intVelYAlien*-1;

            intAliens[j][0] = intAliens[j][0]+intVelXAlien;
            if (j%2==0)
            {
                intAliens[j][1] = intAliens[j][1]-intVelYAlien;
            }
            else
            {
                intAliens[j][1] = intAliens[j][1]+intVelYAlien;
            }
            //chrOpcao=WaitKey();
            DesenharAlien(j,intAliens[j][0],intAliens[j][1]);
        }
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
        DesenharTorpedo(intPosXTorpedo,intPosYTorpedo);
        intNumTorpedos++;
    }
}

void MoverTorpedo()
{
    intPosYTorpedo=intPosYTorpedo-intVelTorpedo;
    if(intPosYTorpedo<=2) RemoverTorpedo();
    if(intNumTorpedos==1) DesenharTorpedo(intPosXTorpedo,intPosYTorpedo);
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

void Inicializar()
{
    VDP60Hz();
    intPosXCanhao=120;
    intPosYCanhao=190;
    intVelCanhao=2;
    intVelXAlien=1;
    intVelYAlien=1;
    intXAlienInicial=175;
    intYAlienInicial=88;
    intAliens[0][0] = intXAlienInicial;
    intAliens[0][1] = intYAlienInicial;
    intVelTorpedo=2;
    intNivel=1;
    intNumTorpedos=0;
    intMsxType=ReadMSXtype();
    
    switch(intMsxType)
    {
        case 0:
           PrintString(MSGMSX1);
        break;
        case 1:
           PrintString(MSGMSX2);
        break;
        case 2:
            PrintString(MSGMSX2P);
        break;
        case 3:
            PrintString(MSGMSXTR);
        break;
    }
}

void TelaInicial()
{
    Screen(5);
    Cls(); 
    SpriteReset();
    LoadSpritesTable();
    SpriteOn();
    Sprite8();
    SpriteDouble();
    DesenharAlien(0,intAliens[0][0],intAliens[0][1]);
    DesenharCanhao();
}

void main(void) 
{
    Inicializar();   
    TelaInicial();       
	
    // Game Loop
    while(1)
    {
        MoverTorpedo(); 
	    PegarComandos();
        DesenharCanhao(); 
        MoverAliens();
    }
}