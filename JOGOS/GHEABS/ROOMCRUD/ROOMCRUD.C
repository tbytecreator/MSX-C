// ===================================
// ROOM CRUD
// ===================================
// Este programa cadastra as salas 
// usadas nos mapas
// Manoel Neto - 2023-10-11
// ===================================
#include "../fusion-c/header/msx_fusion.h"
#include "../fusion-c/header/io.h"
#include <string.h>
#include <stdio.h>
#include "PTBR.H"

// ===================================
// Essa estrutura define uma sala  
// de labirinto
// ===================================
struct MazeRoomClass 
{   
  char id[4];
  char name[31];
  char description[256];
  char fileName[9];                  
}; 

// globals
static FCB file;
struct MazeRoomClass mazeRoom; 

// ===================================
// FUSION-C FILENAME
// ===================================
void FT_SetName(FCB *p_fcb, const char *p_name) 
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
    Print("\n>");
}

// ===================================
// List all classes
// ===================================
void List()
{
  // Variable
  char sbuf[255];
  int n;
  
  // User interface 
  Print(MSGLIST1);
  Print("\n");
  n=FindFirst("*.roo",sbuf,0);
  for(;!n;)
  {
    Print("\n");
    Print(sbuf);
    n=FindNext(sbuf);
  }
  Print("\n");
}

// ===================================
// Create 
// ===================================
void CreateRoom()
{
  // VARIABLESS
	char MaxToWrite=17;
  
  // GET USER INPUT
  List();

  // id
  Print(MSGMCREATE4);
  InputString(mazeRoom.id,3);

  // name
  Print(MSGMCREATE1);
  InputString(mazeRoom.name,30);

  // description
  Print(MSGMCREATE5);
  InputString(mazeRoom.description,255);

  // filename
  Print(MSGMCREATE2);
  InputString(mazeRoom.fileName,8);
  strcat(mazeRoom.fileName,".ROO");
    
  // CREATE FILENAME
  FT_SetName(&file,mazeRoom.fileName);
  if(FcbCreate(&file)!=FCB_SUCCESS) 
  {
     FT_errorHandler(4,mazeRoom.fileName);
  } 
  FcbWrite(&file,strcat(mazeRoom.name,"\n"),MaxToWrite);        
  FcbClose(&file);
  Print(MSGMCREATE3);
}

// ===================================
// Update an existing class
// ===================================
void Update()
{

}

// ===================================
// Retrive an existing class
// ===================================
void Retrive()
{
  char MaxToRead=21;
	char buffer[21];

  // User input
  List(); 
  Print("\n");
  Print(MSGRETRIVE1);
  InputString(mazeRoom.fileName,10);
  StrConcat(mazeRoom.fileName,".ROO");
  
  // Open file 
  FT_SetName( &file,mazeRoom.fileName);
  if(FcbOpen(&file)!=FCB_SUCCESS) 
  {
    FT_errorHandler(1,mazeRoom.fileName);
  }
  FcbRead(&file,buffer,MaxToRead);

  // Transfer buffer to structure 
  StrCopy(mazeRoom.name,buffer);

  // Print data to user 
  Print(MSGRETRIVE3);
  Print("\n");
  Print(mazeRoom.name);
  Print("\n");

  // Close file 
  FcbClose(&file);
  Print(MSGRETRIVE2);
}

// ===================================
// Delete
// ===================================
void Delete()
{

}

// ===================================
// Program Start
// ===================================
void main(void) 
{  			
    // Variables 
    char option=0;

    // User Screen
    Screen(0);
    SetColors(15,1,1);
    Width(80);
    while(option!='6')
    {
        PrintMenu();
        option = InputChar();
        if(option == '1') List();
        if(option == '2') CreateRoom();
        if(option == '3') Retrive();
        if(option == '4') Update();
        if(option == '5') Delete();
    }
    Print("\n");
}