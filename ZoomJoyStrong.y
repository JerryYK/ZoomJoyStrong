%{
	#include <stdio.h>
	int yylex();
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
%token END
%token END_STATEMENT

%%

program:	list_of_expr
	;

list_of_expr:	expr
	|	list_of_expr expr
	;

expr:		LINE INT INT INT INT END_STATEMENT
	|	POINT INT INT END_STATEMENT
	|	CIRCLE INT INT INT END_STATEMENT
	|	RECTANGLE INT INT INT INT END_STATEMENT
	|	SET_COLOR INT INT INT END_STATEMENT
	|	END
	;

%%

int main(int argc, char** argv){
	yyparse();
}
int yyerror(const char* err){
	printf("%s\n", err);
}
