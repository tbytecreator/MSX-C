#include "fusion-c/header/msx_fusion.h"

int main(void) 
{
  // Usar a função BIOS diretamente
  char *msg = "Oi Mundo!\r\n";
  while (*msg) {
    bchput(*msg);
    msg++;
  }
  return 0;
}
