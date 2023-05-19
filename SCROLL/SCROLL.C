// Quick & Dirty Horizontal Scroll in Screen 5
// Fusion-C 1.3
#include "fusion-c/header/msx_fusion.h"
#include "fusion-c/header/vdp_graph2.h"
char tile=4;
char sc=0;

void TilesCreation(void)
{
	char i;
    for ( i = 0; i < 15; ++i)
	{
		BoxFill(0,256+i*8,8,256+8+i*8,i,0);
		BoxLine(0,256+i*8,8,256+8+i*8,15,0);
	}
}

void PrintTiles(void)
{
	char i=0;
	char y=0;
	unsigned int sx,sy,dx,dy;
	while (i<24)
	{
		sx=0;
		sy=256+tile*8;
		dx=256-8;
		dy=y;

		HMMM(sx,sy,dx,dy,8,8);	
	
		tile++;
		y+=8;
		sc++;
		if (tile>14)
		{
			tile=0;
		}
		if (y>192)
		{
			y=0;
		}
		i++;
	}
}

void Scroll(void)
{
	sc++;
	SetAdjust(sc, 0);
	if (sc>7)
	{	SetAdjust(0, 0);
		HMMM(8,0,0,0,248,192);
		PrintTiles();
		sc=0;
	}

}

void main (void)
{
    SetColors(15,0,1);
	Screen(5);
	Cls();
	KeySound(0);			
	SpriteReset();			
	Sprite16();				
	VDP60Hz();

	TilesCreation();
	SetAdjust(0, 0);
	PrintTiles();
	while (1)
	{
	    	Scroll();
	}
}