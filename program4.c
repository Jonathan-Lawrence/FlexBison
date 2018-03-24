//Jonathan Lawrence
//jml160230@utdallas.edu
//CS3377.501
//Program 4 - driver file

#include <string.h> //for strcmp()
#include <stdio.h>  //for printf()
#include <stdlib.h> 
#include "y.tab.h"  //for tokens

int yylex(void);
int yyparse(void);
extern char* yytext;

//Lexical Analyzer function
//called by main() to start scanner without parser

void scanner() 
{
  int token;

  token = yylex(); //yylex returns token

  while(token != 0) {
    
    printf("The current token corresponds to: "); //specifies which token was found and corresponding value 

    switch(token) {
    case NAME:
      printf("NAME (%s)\n", yytext);
      break;
    case ID:
      printf("ID (%s)\n", yytext);
      break;
    case NAME_INITIAL:
      printf("INITIAL (%s)\n", yytext);
      break;
    case ROMAN:
      printf("ROMAN (%s)\n", yytext);
      break;
    case SR:
      printf("SR\n");
      break;
    case JR:
      printf("JR\n");
      break;
    case EOL:
      printf("EOL\n");
      break;
    case INT:
      printf("INT (%d)\n", atoi(yytext));
      break;
    case COMMA:
      printf("COMMA\n");
      break;
    case DASH:
      printf("DASH\n");
      break;
    case HASH:
      printf("HASH\n");
      break;
    default:
      printf("unknown\n");
    }
    token = yylex();
  }
  printf("Reached end of file\n"); //loops until EOF
}

//Parsing function
//called by main() and uses scanner and parser
void parser()
{
  printf("\nRunning in parser mode...\n");

  switch (yyparse())
    {
    case 0:
      printf("\nParse Successful!\n");
      break;
    case 1:
      printf("Parse Failed!\n");
      break;
    case 2:
      printf("Out of memory\n");
      break;
    default:
      printf("Unkwown result of yyparse()\n");
      break;
    }
  printf("Finished with the parser.\n");
}

//DRIVER PROGRAM
int main(int argc, char** argv)
{
  if(!strcmp(argv[0], "./scanner")) {
    scanner(); //if program called with scanner symbolic link
  }
  else if(!strcmp(argv[0], "./parser")){
      parser(); //if program called with parser symbolic link
  }
  else {
      printf("Call the program in the cmdline with one of the symbolic links: scanner or parser.\n");
      return -1; //if program called without symbolic link
  }
  return 0;
}    
