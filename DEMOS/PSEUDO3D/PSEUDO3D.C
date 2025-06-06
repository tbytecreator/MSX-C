// ===================================
// SIMULACAO DE PSEUDO3D
// REQUITOS POR AUGUSTO BAFFA
// CODIFICACAO MANOEL NETO
// ===================================

#include "fusion-c/header/msx_fusion.h"
#include "fusion-c/header/vdp_graph1.h"
#include "fusion-c/header/vdp_sprites.h"
#include "assets/PTBR.H"
#include "assets/SPRITES.H"

// cores 
int skyblue[3] = {135, 206, 235}; 
int darkgray[3] = {169, 169, 169}; 
int greenmedium[3] = {10, 111, 10}; 
int whitesmoke[3] = {245, 245, 245}; 
int darkgreen[3] = { 0, 100, 0};
int white[3] = {255, 255, 255};

// esquema de cores 
struct Colors   
{ 
    int sky[3] , 
    LIGHT = {road=darkgray,grass=greenmedium,lane=whitesmoke},
    DARK = {road=darkgray,grass=darkgreen},
    START = {road=white,grass=greenmedium}
}

= skyblue

void LoadSpritesTable()
{
    
}

int RandomColorLightness(n)
{ 
    if(n % 2 == 0)
    { 
        return COLORS.DARK
    }
    else 
    {   
        return COLORS.LIGHT
    }
}

void BuildRoad() 
{ 
    segments = {};
    for(n=1,n==500,n++)
    {  
        //tamanho arbitrário para estrada (n segmentos) 
        seg = {index =n, p1 = { world = { z = (n-1)} 
        // indíce do segmento na tabela
        // ponto p1 do segmento * segmentLength ,
        camera = { z = 1, y = 1, x = 1, w = 1, scale = 1}, screen = { z = 1, y = 1, x = 1, w = 1, scale = 1}
    }, 
    p2 = {
        //ponto p2 do segmento
        world = { z = n * segmentLength }, 
        camera = { z = 1, y = 1, x = 1, w = 1, scale = 1}, 
        screen = {z = 1, y = 1, x = 1, w = 1, scale = 1}
    }, 
    color = randomColorLightness(math.floor(n/rumbleLength)), looped = false
} 
table.insert(segments, seg)
}


void DesenharSprite()
{
    PutSprite(8,0,intPosXCanhao,intPosYCanhao,8);
}

void Inicializar()
{   
    intMsxType=ReadMSXtype();
}

void TelaInicial()
{
    VDP60Hz();
    Screen(2);
    SetColors(15,1,1);
    Cls(); 
    SpriteReset();
    LoadSpritesTable();
    SpriteOn();
    Sprite8();
    SpriteDouble();
}

void main(void) 
{
    Inicializar();   
    TelaInicial();       
}