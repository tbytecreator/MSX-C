#include "fusion-c/header/msx_fusion.h"
#include "fusion-c/header/vdp_graph1.h"
#include "fusion-c/header/vdp_graph2.h"
#include "fusion-c/header/io.h"

typedef struct {
    char *texto;
    int x;
    int y;
} MenuItem;

// Função para desenhar menu
void DrawMenu(MenuItem items[], int numItems, int selected) 
{
    int i;
    
    for(i = 0; i < numItems; i++) 
    {
        Locate(items[i].x, items[i].y);
        
        // Destaca item selecionado
        if(i == selected) 
        {
            SetColors(1, 15, 1);  // Texto preto, fundo branco, borda preta
            Print(items[i].texto);
            SetColors(15, 1, 1);  // Texto branco, fundo preto, borda preta
        } 
        else 
        {
            Print(items[i].texto);
        }
    }
}

// Função principal do menu
void ShowMenu(MenuItem items[], int numItems) 
{
    int selected = 0;
    int key;
    int exit = 0;
    
    while(!exit) 
    {
        DrawMenu(items, numItems, selected);
        key = WaitKey();
        
        switch(key) 
        {
            case 0x1E:  // Seta para cima
                if(selected > 0) selected--;
                break;
            case 0x1F:  // Seta para baixo
                if(selected < numItems-1) selected++;
                break;
            case 13:    // ENTER
                exit = 1;
                break;              
            case 27:    // ESC
                selected = -1;
                exit = 1;
                break;
        }
    }
    return;
}

void main(void)
{
    int option=0;
    MenuItem menuItems[] = {
        {"1. Iniciar Jogo",5,5},
        {"2. Configuracoes",5,6},
        {"3. Creditos",5,7},
        {"4. Sair",5,8}
    };    
    Cls();
    ShowMenu(menuItems, 4);
    WaitKey();
}
