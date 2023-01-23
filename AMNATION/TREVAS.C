// ========================
// ALIEMINATION
// UM JOGO EM FUSION - C 
// POR MANOEL NETO
// ========================

#include <string.h>
#include "fusion-c/header/msx_fusion.h"
#include "fusion-c/header/vdp_graph2.h"
#include "fusion-c/header/vdp_SPRITES.h"
#include "assets/PTBR.H"
#include "assets/SPRITES.C"

int intPosXNave,intPosYNave,intVelNave;
int intXColisao,intYColisao;
int intCidades;
int intVelAlien,intNumAliens;
int intNivel;
int intPosXTorpedo,intPosYTorpedo,intNumTorpedos,intVelTorpedo;
int intMsxType;
char chrOpcao;
static FCB file;
unsigned char LDbuffer[2200];

void LoadSpritesTable()
{
    SetSpritePattern(0,Nave,8);
    SC5SpriteColors(0,NaveColors);
    SetSpritePattern(1,Torpedo,8);
    SC5SpriteColors(1,TorpedoColors);
}

void SC5Data(char *buffer, int y, int nbl)
{
    int i,s;
    s=0;
    for ( i = 0; i < nbl*128; ++i)
    {
        Vpoke(y*128+s,buffer[i]);
        s=s+1;
    }
}

void SetName(FCB *p_fcb, const char *p_name) 
{
  char i, j;
  memset(p_fcb, 0, sizeof(FCB));
  for(i = 0; i < 11; i++) 
  {
    p_fcb->name[i] = ' ';
  }
  for(i = 0; (i < 8) && (p_name[i] != 0) && (p_name[i] != '.'); i++ ) 
  {
    p_fcb->name[i] =  p_name[i];
  }
  if( p_name[i] == '.' ) 
  {
    i++;
    for( j = 0; (j < 3) && (p_name[i + j] != 0) && (p_name[i + j] != '.'); j++ ) 
    {
      p_fcb->ext[j] =  p_name[i + j] ;
    }
  }
}

int LoadSc5Image(char *file_name, unsigned int start_Y, char *buffer)
{
    int rd=2304;
    int nbl=0;
    InitPSG();
    SetName(&file,file_name);
    fcb_open(&file);
    fcb_read(&file,buffer,7);  // Skip 7 first bytes of the file
    while(rd!=0)
    {
        rd = fcb_read(&file,buffer,2176);
        if (rd!=0)
        {
            nbl=rd/128;
            SC5Data(buffer,start_Y,nbl);
            start_Y=start_Y+nbl; 
        }
    }
    fcb_close(&file);
    return(1);
}

void Inicializar()
{
    VDP60Hz();
    intPosXNave=120;
    intPosYNave=190;
    intVelNave=2;
    intCidades=4;
    intVelAlien=1;
    intNumAliens=0;
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
    PrintString(MSGINICIOJOGO);
    chrOpcao=WaitKey();
}

void DesenharNave(int x,int y)
{
    PutSprite(0,0,x,y,1);
}

void TelaInicial()
{
    Screen(5);
    Cls();
    LoadSc5Image("SPLASH.SC5",0,LDbuffer);  
    chrOpcao=WaitKey();
    Cls(); 
    SpriteReset();
    LoadSpritesTable();
    SpriteOn();
    Sprite8();
    SpriteDouble();
    DesenharNave(intPosXNave,intPosYNave);
}

void ProximoNivel()
{
    intNivel++;
}

void GerarAliens()
{

}

void TestaFimJogo()
{

}

void TestaNovoNivel()
{

}

void MoverAliens()
{

}

void MoverNave()
{
    DesenharNave(intPosXNave,intPosYNave);
}

// =====================================
// Desenhar o torpedo na tela
// =====================================
void DesenharTorpedo(int x,int y)
{
    PutSprite(1,1,x,y,1);
}

// =====================================
// Criar um torpedo
// =====================================
void CriarTorpedo()
{
    if(intNumTorpedos==0)
    {
        intPosXTorpedo=intPosXNave;
        intPosYTorpedo=intPosYNave-2;
        DesenharTorpedo(intPosXTorpedo,intPosYTorpedo);
        intNumTorpedos++;
    }
}

// =====================================
// Move o torpedo quando na tela
// =====================================
void MoverTorpedo()
{
    intPosYTorpedo=intPosYTorpedo-intVelTorpedo;
    if(intPosYTorpedo<=1) RemoverTorpedo();
    if(intNumTorpedos==1) DesenharTorpedo(intPosXTorpedo,intPosYTorpedo);
}

void RemoverTorpedo()
{
    intNumTorpedos=0;
}

void ChecarColisao()
{
    intXColisao = SpriteCollisionX();
    intYColisao = SpriteCollisionY();
}

void PegarComandos()
{
    int intMove=JoystickRead(0);
    int intFire=TriggerRead(0);
    switch (intMove)
    {
        case 2:
            /* up & right */
            intPosXNave=intPosXNave+intVelNave;
        break;
        case 3:
            /* right */
            intPosXNave=intPosXNave+intVelNave;
        break;
        case 4:
            /* down & right */
            intPosXNave=intPosXNave+intVelNave;
        break;
        case 6:
            /* down & left */
            intPosXNave=intPosXNave-intVelNave;
        break;
        case 7:
            /* left */
            intPosXNave=intPosXNave-intVelNave;
        break;
        case 8:
            /* up & left */
            intPosXNave=intPosXNave-intVelNave;
        break;
    }
    if(intPosXNave<=1) intPosXNave=1;
    if(intPosXNave>=228) intPosXNave=228;
    if(intFire==255 && intNumTorpedos==0) CriarTorpedo();
}

void main(void) 
{
    Inicializar();       //inicializar o ambiente do jogo
    TelaInicial();       //tela de inicio do jogo
	ProximoNivel();      //passa para o proximo nivel
	GerarAliens();       //sorteia os aliens de acordo com o nivel
    while(1)
    {
        MoverTorpedo(); 
	    MoverAliens()  ; 
        PegarComandos(); 
        MoverNave();	 
        ChecarColisao(); 
        TestaNovoNivel();
        ProximoNivel();
        TestaFimJogo(); 
    }
}