// --------------------------------------
// Simulacao de star field 
// Manoel Neto 
// --------------------------------------
#include <stdio.h>
#include <stdlib.h>
#include "fusion-c/header/msx_fusion.h"
#include "fusion-c/header/vdp_graph2.h"

typedef struct 
{
    int x;
    int y;
    int z;
} Star;

int width=256;
int height=212;
Star stars[100];

void Setup()
{
  Screen(5);
  SetColors(15, 0, 0);
  Cls();
  BoxFill(0, 0, width, height, 1, 0);
}

int Random(int max) 
{
  return rand() % max;
}

void Create() 
{
  int i;
  for(i=0; i<100; i++)
  {
    stars[i].x = Random(width);
    stars[i].y = Random(height);
    stars[i].z = width;
  }
}

void Update()
{
  int i;
  for(i=0; i<100; i++)
  {
    if(stars[i].z <= 0)
    {
      stars[i].x = Random(width);
      stars[i].y = Random(height);
      stars[i].z = width;
    }
    else
    {
      stars[i].z = stars[i].z--;
      stars[i].x = stars[i].x -stars[i].z/width;
      stars[i].y = stars[i].y -stars[i].z/height;
    }
  }
} 

void Draw() 
{
  int i;
  for(i=0; i< 100; i++)
  {
    Pset(stars[i].x, stars[i].y,15,0);  
  }
}

int main(void) 
{
  Setup();    // prepara o ambiente de desenho
  Create();   // cria as estrelas
  while(1)  
  {
    Update(); // atualiza a posicao das estrelas
    Draw();   // desenha as estrelas
  }
  return 0;
}