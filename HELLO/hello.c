//
// Fusion-C
// My First Program in C
//
#include "fusion-c/header/msx_fusion.h"
#include "fusion-c/header/g9klib.h"

#define  __SDK_MSXVERSION__ 2

void main(void) 
{
  unsigned char detect;

  detect = G9Detect();
  PrintNumber(detect);

   //G9SpritesEnable();
   //G9SpritesDisable();

}
 