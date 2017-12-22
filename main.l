%option noyywrap

%{
#include <stdio.h>
#include "main.tab.h"
%}

%%

[\s\t] ;
[0-9]+ { yylval = atoi(yytext); return INT; }
\n { return NEWLINE; }
"true"|"false" { return BOOL; }
"+" { return PLUS;}
"*" { return MULT; }
"==" { return EQ; }
"(" { return L_PAREN; }
")" { return R_PAREN; }

%%