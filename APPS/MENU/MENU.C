#include <string.h>
#include <stdio.h>
#include "fusion-c/header/msx_fusion.h"
#include "fusion-c/header/vdp_graph1.h"
#include "fusion-c/header/io.h"

typedef struct {
    char *texto;
} MenuItem;

MenuItem *menuItems = NULL;
int menuItemCount = 0;

void AddMenuItem(const char *text, int x, int y) 
{
    menuItems = (MenuItem *)realloc(menuItems, (menuItemCount + 1) * sizeof(MenuItem));
    menuItems[menuItemCount].texto = strdup(text);
    menuItemCount++;
}

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
    struct FCB fcb;
    char filename[13];

    // Abre o diretório atual
    int handle = opendir("");

    if (handle == -1) {
        printf("Erro ao abrir o diretório.\n");
        return;
    }

    // Lê os arquivos do diretório
    while (readdir(handle, &fcb) != EOF)
    {
        // Obtém o nome do arquivo
        strncpy(filename, fcb.fname, 12);
        filename[12] = '\0'; // Garante que a string esteja terminada corretamente

        // Verifica se o arquivo termina com .ROM
        if (strcasecmp(&filename[strlen(filename) - 4], ".rom") == 0) 
        {
            printf("%s\n", filename);
        }
    }

    closedir(handle); // Fecha o diretório
}

void main(void)
{
    // prepara a tela
    Screen(0);
    SetColors(2, 0, 0);
    Cls();

    // desenha o menu
    DrawBox(0,0,40,2);
    Locate(1,1);Print("TBC EXECUTOR");
    DrawBox(0,3,40,15);
    DrawBox(0,19,40,2);
    Locate(1,20);Print("ESCOLHA UM ARQUIVO PARA GRAVAR");

    // le os arquivos do diretorio
    ReadFiles();
}
