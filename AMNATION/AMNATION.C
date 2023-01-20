// ========================
// ALIEMINATION
// UM JOGO EM FUSION - C 
// POR MANOEL NETO
// ========================

#include "fusion-c/header/msx_fusion.h"
#include "fusion-c/header/vdp_graph2.h"
#include "fusion-c/header/vdp_SPRITES.h"
#include "STRINGS.H"
#include "SPRITES.C"

int intPosXNave,intPosYNave,intVelNave;
int intXColisao,intYColisao;
int intCidades;
int intVelAlien,intNumAliens;
int intNivel;
int intNumTorpedos;
char chrOpcao; 

void LoadSpritesTable()
{
    SetSpritePattern(1,NaveFront,8);
    SetSpritePattern(2,NaveBack,8);
}

void Inicializar()
{
   intPosXNave=120;
   intPosYNave=88;
   intVelNave=4;
   intCidades=4;
   intVelAlien=1;
   intNumAliens=0;
   intNivel=1;
   intNumTorpedos=0;
   Sprite16();
   VDP60Hz();
   PrintString(MSGINICIOJOGO);
   chrOpcao=WaitKey();
}

void TelaInicial()
{
    Screen(2);
    LoadSpritesTable();
    PutSprite(1,1,intPosXNave,intPosYNave,1);
    PutSprite(2,2,intPosXNave,intPosYNave,11);
    //Desenhar Cidades
}

void ProximoNivel()
{}

void GerarAliens()
{}

void TestaFimJogo()
{}

void TestaNovoNivel()
{}

void MoverTorpedos()
{}

void MoverAliens()
{}

void PegarComandos()
{}

void MoverNave()
{}

void ChecarColisao()
{
    intXColisao = SpriteCollisionX();
    intYColisao = SpriteCollisionY();
}


void main(void) 
{
    Inicializar();       //inicializar o ambiente do jogo
    TelaInicial();       //tela de inicio do jogo
	ProximoNivel();      //passa para a proxima semana
	GerarAliens();       //sorteia os aliens de acordo com a semana
    while(1)
    {
        MoverTorpedos(); //atualiza coordenadas dos torpedos
	    MoverAliens()  ; //atualiza coordenadas dos Aliens
        PegarComandos(); //pega a entrada de teclado do jogador
        MoverNave();	 //atualiza coordenadas da nave
        ChecarColisao(); //checa as colisoes
        TestaNovoNivel();//testa se os aliens foram eliminados
        TestaFimJogo();  //testa se o jogo acabou 
    }
}