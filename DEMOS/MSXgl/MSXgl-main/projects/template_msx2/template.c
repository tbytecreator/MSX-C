#include "msxgl.h"

void Plot(const u8 x,const u8 y,const u8 c);

void main()
{
	VDP_SetMode(VDP_MODE_GRAPHIC4);
	VDP_ClearVRAM();

	// clear the screen to black (palette entry 1)
	for(u8 y = 0; y < 212; y++) VDP_FillVRAM_128K(0x11,y*128,0,128);
	// draw initial rectangle
	for(u8 y = 50; y < 100; y++) VDP_FillVRAM_128K(0x99,y*128,0,25);
	// move the rectangle
	u8 pos = 0;
	while (true)
	{
		VDP_SetColor(9);
		u16 a = pos + 50 * 128;
		for(u8 y = 50; y < 100; y++, a += 128 )
		{
			// clear pixel on left side of square
			VDP_Poke_128K(0x11, a, 0);
			// draw a pixel on the right side
			VDP_Poke_128K(0x99,a+24,0);
		}
		VDP_SetColor(3);	
		Halt();
		pos++;
	}
}

void Plot(const u8 x,const u8 y,const u8 c)
{
	const u16 a = x / 2 + y * 128;
	const u8 v = VDP_Peek_128K(a,0);
	if (x & 1) VDP_Poke_128K( (v & 0xF0) + c, a, 0 );
	else VDP_Poke_128K( (v & 15) + (c << 4), a, 0 );
}