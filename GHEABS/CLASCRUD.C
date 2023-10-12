// ===================================
// CLASS CRUD
// ===================================
// Este programa cadastra as classes
// de personagens do jogo GHEA BASIC
// MODULE
// Manoel Neto - 2023-10-11
// ===================================
#include "fusion-c/header/msx_fusion.h"
#include "fusion-c/header/io.h"
#include <string.h>
#include <stdio.h>
#include "assets/PTBR.H"

// ===================================
// Essa estrutura define uma classe 
// de personagem para o jogo 
// ===================================
struct GheaClass 
{   
  char name[21];
  char fileName[9];                  
}; 

// globals
static FCB file;
struct GheaClass caracterClass; 

// ===================================
// FUSION-C FILENAME
// ===================================
void FT_SetName( FCB *p_fcb, const char *p_name ) 
{
  char i, j;
  memset( p_fcb, 0, sizeof(FCB) );
  for( i = 0; i < 11; i++ ) {
    p_fcb->name[i] = ' ';
  }
  for( i = 0; (i < 8) && (p_name[i] != 0) && (p_name[i] != '.'); i++ ) {
    p_fcb->name[i] =  p_name[i];
  }
  if( p_name[i] == '.' ) {
    i++;
    for( j = 0; (j < 3) && (p_name[i + j] != 0) && (p_name[i + j] != '.'); j++ ) {
      p_fcb->ext[j] =  p_name[i + j] ;
    }
  }
}

// ===================================
// FUSION-C FILE ERROR HANDLER
// ===================================
void FT_errorHandler(char n, char *name)            
{
    switch (n)
    {
        case 1:
            Print("\n\rFAILED: FcbOpen(): ");
            Print(name);
        break;
 
        case 2:
            Print("\n\rFAILED: FcbClose():");
            Print(name);
        break;  
 
        case 3:
            Print("\n\rStop Kidding, run me on MSX2 !");
        break; 

        case 4:
            Print("\n\rFAILED: fcb write: ");
            Print(name);
        break;
    }
    Exit(0);
}

// ===================================
// Show main menu
// ===================================
void PrintMenu()
{
    Print(MSGHEADER);
    Print(MSGLINE11);
    Print(MSGMENU11);
    Print(MSGMENU12);
    Print(MSGMENU13);
    Print(MSGMENU14);
    Print(MSGMENU15);
    Print(MSGMENU16);
    Print(MSGLINE11);
    Print(">");
}

// ===================================
// List all classes
// ===================================
void ListClasses()
{

}

// ===================================
// Create a new class
// ===================================
void CreateClass()
{
    // VARIABLESS
	char MaxToWrite=17;
  
    // GET USER INPUT 
    Print(MSGMCREATE1);
    InputString(caracterClass.name,20);
    Print(MSGMCREATE2);
    InputString(caracterClass.fileName,8);
    strcat(caracterClass.fileName,".CLS");
    
    // CREATE FILENAME
    FT_SetName(&file,caracterClass.fileName);
    if(FcbCreate(&file)!=FCB_SUCCESS) 
    {
        FT_errorHandler(4,caracterClass.fileName);
    } 
    FcbWrite(&file,strcat(caracterClass.name,"\n"),MaxToWrite);        
    FcbClose(&file);
    Print(MSGMCREATE3);
}

// ===================================
// Update an existing class
// ===================================
void UpdateClass()
{

}

// ===================================
// Retrive an existing class
// ===================================
void RetriveClass()
{

}

// ===================================
// Delete an existing class
// ===================================
void DeleteClass()
{

}

// ===================================
// Program Start
// ===================================
void main(void) 
{  			
    char option;

    Screen(0);
    SetColors(15,1,1);
    Width(80);
    while(option!='6')
    {
        PrintMenu();
        option = InputChar();
        if(option == '1') ListClasses();
        if(option == '2') CreateClass();
        if(option == '3') RetriveClass();
        if(option == '4') UpdateClass();
        if(option == '5') DeleteClass();
    }
}