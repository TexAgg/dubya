%option noyywrap

%{
#include <stdio.h>
#include <string.h>
#include "main.tab.h"
%}

%%

[\s\t] ;
[0-9]+ { yylval.ival = atoi(yytext); return INT; }
\n { return NEWLINE; }
"true"|"false" { 
	if (strcmp(yytext, "true") == 0)
		yylval.bval = true;
	else
		yylval.bval = false;
	return BOOL; 
}
"+" { return PLUS;}
"*" { return MULT; }
"==" { return EQ; }
"(" { return L_PAREN; }
")" { return R_PAREN; }

%%