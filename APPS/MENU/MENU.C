#include "fusion-c/header/msx_fusion.h"
#include "fusion-c/header/vdp_graph1.h"
#include "fusion-c/header/vdp_graph2.h"
#include "fusion-c/header/io.h"

typedef struct {
    char *texto;
    int x;
    int y;
} MenuItem;

// Função para ativar modo 80 colunas
void Set80Columns(void) 
{
    char version;

    version = GetMsxVersion();
    Print("Version: ");
    PrintDec(version);
    Print("\n\r");

    Screen(0);
    if (version >= 1)
    {
        Width(80);
    }
    else
    {
        Width(40);
    }
}

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
int ShowMenu(MenuItem items[], int numItems) 
{
    int selected = 0;
    int key;
    int exit = 0;
    
    // Esconde o cursor
    //PutChar(0x1B); PutChar('x'); PutChar('5');

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
    
    // Mostra o cursor novamente
    PutCharHex(0x1B); PutCharHex('y'); PutCharHex('5');

    return selected;
}

void main(void)
{
    int escolha;
    MenuItem menuItems[] = {
        {"1. Iniciar Jogo", 5, 5},
        {"2. Configuracoes", 5, 6},
        {"3. Creditos", 5, 7},
        {"4. Sair", 5, 8}
    };
    
    Set80Columns();
    //Cls();
    
    // Define cores padrão
    SetColors(15, 1, 1);  // Texto branco (15), fundo preto (1), borda preta (1)
    
    Print("\n\r=== MENU PRINCIPAL ===\n\n\r");
    Print("Use as setas para mover e ENTER para selecionar\n\r");
    
    escolha = ShowMenu(menuItems, 4);
    
    //Cls();
    Print("\n\rVoce selecionou: ");
    if(escolha >= 0) 
    {
        Print(menuItems[escolha].texto);
    } else 
    {
        Print("Saiu com ESC");
    }
    
    WaitKey();
}
