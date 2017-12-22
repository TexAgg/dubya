%{
#include <stdio.h>
#include <stdlib.h>

extern int yylex();
extern int yyparse();
extern FILE* yyin;
void yyerror(const char* s);
%}

/*
%union {
	int ival;
	bool bval;
}
*/

%token INT
%token BOOL
%token PLUS
%token MULT
%token EQ
%token L_PAREN R_PAREN
%token NEWLINE

%start calculation

%%

calculation:
	| calculation line
;

line: NEWLINE
	| expression NEWLINE { printf("\tResult: %i\n", $1); }
;

expression: 
	| INT { $$ = $1; }
	| BOOL { $$ = $1; }
	| expression MULT expression { $$ = $1 * $3; }
	| expression PLUS expression { $$ = $1 + $3; }
	| expression EQ expression { $$ = $1==$3; }
	| L_PAREN expression R_PAREN { $$ = $2; }
;

%%

int main() {
	yyin = stdin;
	do { 
		yyparse();
	} while(!feof(yyin));
	return 0;
}

void yyerror(const char* s) {
	fprintf(stderr, "Parse error: %s\n", s);
	exit(1);
}