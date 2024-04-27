#include <stdlib.h>
#include <stdio.h>
#include "fusion-c/header/msx_fusion.h"
 
extern int count;
 
void write_extern(void) 
{
   Print("O Contador é:");
   PrintNumber(count);
}