%{
	#include <stdio.h>
	int yyerror(const char* err);
%}

%union {int ival; float fval;}
%token LINE
%token CIRCLE
%token RECTANGLE
%token SET_COLOR
%token POINT
%token FLOAT
%token INT
%token X
%token Y
%token U
%token V
%token R
%token W
%token H
%token G
%token B
%token END
%token END_STATEMENT

%%

program:	list_of_expr
	;

list_of_expr:	expr
	|	list_of_expr expr
	;

expr:		LINE INT X INT Y INT U INT V END_STATEMENT
	|	POINT INT X INT Y END_STATEMENT
	|	CIRCLE INT X INT Y INT R END_STATEMENT
	|	RECTANGLE INT X INT Y INT W INT H END_STATEMENT
	|	SET_COLOR INT R INT G INT B END_STATEMENT
	|	END
	;

%%

int main(int argc, char** argv){
	yyparse();
}
int yyerror(const char* err){
	printf("%s\n", err);
}
