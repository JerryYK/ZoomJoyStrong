%{
	#include <stdio.h>
        #include <SDL2/SDL.h>
	#include "ZoomJoyStrong.h"
	int yylex();
	int yyparse();
	int yywarp();
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
%type<ival> INT
%type<fival> FLOAT

%%

program:	list_of_expr
	;

list_of_expr:	expr
	|	list_of_expr expr
	;

expr:		LINE INT INT INT INT{

				//check the input paramters are valid
				if($2 > HEIGHT || $2 > WIDTH || $2 < 0){;}
				else if($3 > HEIGHT || $3 > WIDTH || $3 < 0){;}
				else if($4 > HEIGHT || $4 > WIDTH || $4 < 0){;}
				else if($5 > HEIGHT || $5 > WIDTH || $5 < 0){;}
				else{
					//draw the line
					line($2, $3, $4, $5);
				}
			}
	|	POINT INT INT{

				//check the input paramters are valid
				if($2 > HEIGHT || $2 > WIDTH || $2 < 0){;}
				else if($3 > HEIGHT || $3 > WIDTH || $3 < 0){;}
				else{
					//draw the dot
					printf("Draw POINT at (%s,%s)", $2, $3);
					point($2, $3);
				}
			}
	|	CIRCLE INT INT INT{

				//check the input paramters are valid
				if($2 > HEIGHT || $2 > WIDTH || $2 < 0){;}
				else if($3 > HEIGHT || $3 > WIDTH || $3 < 0){;}
				else if($4 > HEIGHT || $4 > WIDTH || $4 < 0){;}
				else{
					//draw the circle
					circle($2, $3, $4);
				}
			}
	|	RECTANGLE INT INT INT INT{

				//check the input paramters are valid
				if($2 > HEIGHT || $2 > WIDTH || $2 < 0){;}
				else if($3 > HEIGHT || $3 > WIDTH || $3 < 0){;}
				else if($4 > HEIGHT || $4 > WIDTH || $4 < 0){;}
				else if($5 > HEIGHT || $5 > WIDTH || $5 < 0){;}
				else{
					//draw the rectangle
					rectangle($2, $3, $4, $5);
				}
			}
	|	SET_COLOR INT INT INT{

				//check the input paramters are valid
				if($2 > HEIGHT || $2 > WIDTH || $2 < 0){;}
				else if($3 > HEIGHT || $3 > WIDTH || $3 < 0){;}
				else if($4 > HEIGHT || $4 > WIDTH || $4 < 0){;}
				else{
					//set the color
					set_color($2, $3, $4);
				}
			}
	|	END{
			finish();
		}
	;

%%

int main(int argc, char** argv){
	setup();
	yyparse();
}

int yyerror(const char* err){
	printf("%s\n", err);
}

