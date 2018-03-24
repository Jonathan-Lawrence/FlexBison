   /*Jonathan Lawrence
    *CS3377.501
    *jml160230@utdallas.edu
    *scan.l - program4 flex
    */

%option noyywrap
%option nounput
%option noinput

%{
  #include <stdlib.h>
  #include "y.tab.h"
%}

%%

   /* regex for token detection */

[ \t\r]+	 {/*ignore whitespace*/}
\n	{return EOL;}
,	{return COMMA;}
-	{return DASH;}
#	{return HASH;}
Sr.	{return SR;}
Jr.	{return JR;}
[MDCLXVI]+	{yylval.str = strdup(yytext); return ROMAN;}
[0123456789]+	{yylval.value = atoi(yytext); return INT;}
[A-Z][a-z]+	{yylval.str = strdup(yytext); return NAME;}
[A-z0-9]{2,}	{yylval.str = strdup(yytext); return ID;}
^[A-Z]\.?	{yylval.str = strdup(yytext); return NAME_INITIAL;}

%%
