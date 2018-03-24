/*
 * CS3377.501
 * parse.y - Program 4
 * Jonathan Lawrence
 * jml160230@utdallas.edu
 */

%{
  #include <stdio.h>
  int yylex(void);
  void yyerror(const char*);
%}

//creates union data structure
%union
 {
   int value;
   char* str;
 }

//allows for error catching
%define parse.error verbose

//tokens defined here
%token NAME
%token ID
%token NAME_INITIAL
%token ROMAN
%token SR
%token JR
%token EOL
%token INT
%token COMMA
%token DASH
%token HASH

//establishes connection between union and tokens
%type <value> INT
%type <str> NAME
%type <str> ID
%type <str> NAME_INITIAL
%type <str> ROMAN

%start Multiple_Addresses

%%

Multiple_Addresses:
                         Multiple_Addresses EOL Address
                   |     Address
                   ;
Address:
                         Name_Line EOL Street_Line EOL City_State_Line EOL
		   ;

Name_Line:
                         Name
                   |     Name Suffix
		   ;

Street_Line:             
                         House_Number Street_Name Apartment_Number
                   |     House_Number Street_Name
		   ;
City_State_Line:
                         City_Name COMMA State Zipcode
		   ;       

Name: 
 NAME_INITIAL NAME {fprintf(stderr, "<FirstName>%s</FirstName>\n<LastName>%s</LastName>\n", $1, $2);}
|NAME NAME         {fprintf(stderr, "<FirstName>%s</FirstName>\n<LastName>%s</LastName>\n", $1, $2);}
;

Suffix:
 JR               {fprintf(stderr, "<Suffix>Jr.</Suffix>\n");}
|SR               {fprintf(stderr, "<Suffix>Sr.</Suffix>\n");}
|ROMAN            {fprintf(stderr, "<Suffix>%s</Suffix>\n", $1);} 
;

House_Number:
 ID               {fprintf(stderr, "<HouseNumber>%s</HouseNumber>\n", $1);}
|INT              {fprintf(stderr, "<HouseNumber>%d</HouseNumber>\n", $1);}
;

Street_Name:
 NAME             {fprintf(stderr, "<StreetName>%s</StreetName>\n", $1);}
|ID               {fprintf(stderr, "<StreetName>%s</StreetName>\n", $1);}
;

Apartment_Number:
 HASH INT         {fprintf(stderr, "<AptNum>%d</AptNum>\n", $2);}
|INT              {fprintf(stderr, "<AptNum>%d</AptNum>\n", $1);}
;

City_Name:
 NAME             {fprintf(stderr, "<City>%s</City>\n", $1);}
|ID               {fprintf(stderr, "<City>%s</City>\n", $1);}
;

State:
 ID               {fprintf(stderr, "<State>%s</State>\n", $1);}
;

Zipcode:
 INT DASH INT     {fprintf(stderr, "<Zip5>%d</Zip5>\n<Zip4>%d</Zip4>\n\n", $1, $3);}
|INT             {fprintf(stderr, "<Zip5>%d</Zip5>\n\n", $1);}  
;

%%
 //displays error message to stdout
void yyerror(const char* s){
  fprintf(stdout, "%s\n", s);
}
