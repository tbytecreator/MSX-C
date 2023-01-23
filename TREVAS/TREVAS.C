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

int intPosXCanhao,intPosYCanhao,intVelCanhao;
int intXColisao,intYColisao;
int intCidades;
int intVelAlien,intNumAliens;
int intNivel;
int intPosXTorpedo,intPosYTorpedo,intNumTorpedos,intVelTorpedo;
int intMsxType;
int intXAlienInicial,intYAlienInicial;
int Aliens[8][2];
char chrOpcao;
static FCB file;
unsigned char LDbuffer[2200];

// =====================================
// Seta os sprites criados no asset 
// SPRITES.C
// Pattern 0=>Canhao
// Pattern 1=>Torpedo
// Pattern 2=>Alien  
// =====================================
void LoadSpritesTable()
{
    SetSpritePattern(0,Canhao,8);
    SC5SpriteColors(0,CanhaoColors);
    SetSpritePattern(1,Torpedo,8);
    SC5SpriteColors(1,TorpedoColors);
    SetSpritePattern(2,Alien,8);
    SC5SpriteColors(2,AlienColors);
}

// =====================================
// Carrega dados de uma tela em SC5 
// =====================================
void SC5Data(char *buffer, int y, int nbl)
{
    int i,s;
    s=0;
    for (i=0;i<nbl*128;++i)
    {
        Vpoke(y*128+s,buffer[i]);
        s=s+1;
    }
}

// =====================================
// Prepara uma estrutura de arquivo
// =====================================
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
// =====================================
// INICIALIZACAO DO JOGO
// =====================================
void Inicializar()
{
    VDP60Hz();
    intPosXCanhao=120;
    intPosYCanhao=190;
    intVelCanhao=2;
    intCidades=4;
    intVelAlien=1;
    intNumAliens=0;
    intVelTorpedo=2;
    intNivel=1;
    intNumTorpedos=0;
    intYAlienInicial = 118;
    intYAlienInicial = 88;

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

void DesenharCanhao(int x,int y)
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
    DesenharCanhao(intPosXCanhao,intPosYCanhao);
}

void ProximoNivel()
{
    intNivel++;
}

// ================================
// DESENHA UM ALIEN NA TELA
// ================================
void DesenharAlien(int n,int x,int y)
{
    PutSprite(n,2,x,y,12);
}

// =====================================
// Cria a matriz de Aliens 
// =====================================
void GerarAliens()
{
    int i;
    for(i=2;i<10;++i)
    {
        intXAlienInicial=+8;
        Aliens[i-2][0]=intXAlienInicial;
        Aliens[i-2][1]=intYAlienInicial;
        PutSprite(i,2,Aliens[i-2][0],Aliens[i-2][1],12);
    }
}

// ===============================
// MOVE OS ALIENS 
// ===============================
void MoverAliens()
{
    int i;
    for(i=2;i<10;i++)
    {
        Aliens[i][0]=Aliens[i][0]+intVelAlien;
        Aliens[i][1]=Aliens[i][1]+intVelAlien;
        DesenharAlien(i,Aliens[i][0],Aliens[i][1]);
    }
}

// ============================================
// MOVER O CANHAO NA TELA 
// ============================================
void MoverCanhao()
{
    DesenharCanhao(intPosXCanhao,intPosYCanhao);
}

// =====================================
// Desenhar o torpedo na tela
// =====================================
void DesenharTorpedo(int x,int y)
{
    PutSprite(1,1,x,y,1);
}

// =====================================
// Remover o torpedo
// =====================================
void RemoverTorpedo()
{
    intNumTorpedos=0;
}

// =====================================
// Criar um torpedo
// =====================================
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

// =====================================
// Move o torpedo quando na tela
// =====================================
void MoverTorpedo()
{
    intPosYTorpedo=intPosYTorpedo-intVelTorpedo;
    if(intPosYTorpedo<=1) RemoverTorpedo();
    if(intNumTorpedos==1) DesenharTorpedo(intPosXTorpedo,intPosYTorpedo);
}

// =====================================
// CHECA AS COLISOES DE SPRITES
// =====================================
void ChecarColisao()
{
    intXColisao = SpriteCollisionX();
    intYColisao = SpriteCollisionY();
}

// =====================================
// Pega os comandos do jogador 
// =====================================
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

void TestaFimJogo()
{

}

void TestaNovoNivel()
{

}

// =====================================
// MAIN
// =====================================
void main(void) 
{
    Inicializar();   
    TelaInicial();       
	GerarAliens();      
    
    // Game Loop
    while(1)
    {
        MoverTorpedo(); 
	    MoverAliens();
        PegarComandos();
        MoverCanhao(); 
        ChecarColisao(); 
        TestaNovoNivel();
        ProximoNivel();
        TestaFimJogo(); 
    }
}