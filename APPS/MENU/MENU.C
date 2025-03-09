#include <string.h>
#include <stdio.h>
#include "fusion-c/header/msx_fusion.h"
#include "fusion-c/header/vdp_graph1.h"
#include "fusion-c/header/io.h"

typedef struct {
    char *texto;
} MenuItem;

// globals
static FCB file;

/* void AddMenuItem(const char *text, int x, int y) 
{
    menuItems = (MenuItem *)realloc(menuItems, (menuItemCount + 1) * sizeof(MenuItem));
    menuItems[menuItemCount].texto = strdup(text);
    menuItemCount++;
} */

void DrawBox(int x, int y, int width, int height) 
{
    Locate(x,y);
    PrintChar(1);
    PrintChar(88);

    for (int i=0; i<width-2; i++) 
    {
        Locate(x+i+1,y);
        PrintChar(1);
        PrintChar(87);
    }

    Locate(width,y);
    PrintChar(1);
    PrintChar(89);

    for (int i=0; i<height-1; i++) 
    {
        Locate(x,y+i+1);
        PrintChar(1);
        PrintChar(86);

        Locate(width,y+i+1);
        PrintChar(1);
        PrintChar(86);
    }

    Locate(x,y+height);
    PrintChar(1);
    PrintChar(90);

    for (int i=0; i<width-2; i++) 
    {
        Locate(x+i+1,y+height);
        PrintChar(1);
        PrintChar(87);
    }

    Locate(width,y+height);
    PrintChar(1);
    PrintChar(91);

}

void ReadFiles()
{
    // Variable
    char sbuf[255];
    int n;
  
    // User interface 
    n=FindFirst("*.ROM",sbuf,0);
    for(;!n;)
    {
        Print(sbuf);
        Print("\n");
        n=FindNext(sbuf);
    }
}

void main(void)
{
    // prepara a tela
    Screen(0);
    SetColors(2, 0, 0);
    Cls();

    // desenha o menu
    DrawBox(0,0,40,2);
    Locate(1,1);Print("TBC SPIDER FLASH WRITER");
    DrawBox(0,3,40,15);
    DrawBox(0,19,40,2);
    Locate(1,20);Print("ESCOLHA UM ARQUIVO PARA GRAVAR");

    // le os arquivos do diretorio
    Locate(1,4);
    ReadFiles();
}
