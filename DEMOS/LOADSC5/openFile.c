#include <string.h>
#include "fusion-c/header/msx_fusion.h"

static FCB file;

void SetName(FCB *p_fcb, const char *p_name ) 
{
  char i, j;
  memset(p_fcb, 0, sizeof(FCB));
  for( i = 0; i < 11; i++ ) 
  {
    p_fcb->name[i] = ' ';
  }
  for( i = 0; (i < 8) && (p_name[i] != 0) && (p_name[i] != '.'); i++ ) 
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

void main(void)
{ 
    int intIdArquivo;
    SetName(&file,"splash.sc5");
    intIdArquivo = fcb_open(&file);
    PrintNumber(intIdArquivo);
}