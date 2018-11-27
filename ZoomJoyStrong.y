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
				if($2 > HEIGHT || $2 > WIDTH || $2 < 0){printf("Unvaild $2 input!");}
				else if($3 > HEIGHT || $3 > WIDTH || $3 < 0){printf("Unvaild $3 input!");}
				else if($4 > HEIGHT || $4 > WIDTH || $4 < 0){printf("Unvaild $4 input!");}
				else if($5 > HEIGHT || $5 > WIDTH || $5 < 0){printf("Unvaild $5 input!");}
				else{
					//draw the line
					//printf("Draw LINE from (%s,%s) to (%s, %s)", $2, $3, $4, $5);
					line($2, $3, $4, $5);
				}
			}
	|	POINT INT INT{

				//check the input paramters are valid
				if($2 > HEIGHT || $2 > WIDTH || $2 < 0){printf("Unvaild $2 input!");}
				else if($3 > HEIGHT || $3 > WIDTH || $3 < 0){printf("Unvaild $3 input!");}
				else{
					//draw the dot
					//printf("Draw POINT at (%s,%s)", $2, $3);
					point($2, $3);
				}
			}
	|	CIRCLE INT INT INT{

				//check the input paramters are valid
				if($2 > HEIGHT || $2 > WIDTH || $2 < 0){printf("Unvaild $2 input!");}
				else if($3 > HEIGHT || $3 > WIDTH || $3 < 0){printf("Unvaild $3 input!");}
				else if($4 > HEIGHT || $4 > WIDTH || $4 < 0){printf("Unvaild $4 input!");}
				else{
					//draw the circle
					//printf("Draw CIRCLE at (%s,%s) whit radio: %s", $2, $3, $4);
					circle($2, $3, $4);
				}
			}
	|	RECTANGLE INT INT INT INT{

				//check the input paramters are valid
				if($2 > HEIGHT || $2 > WIDTH || $2 < 0){printf("Unvaild $2 input!");}
				else if($3 > HEIGHT || $3 > WIDTH || $3 < 0){printf("Unvaild $3 input!");}
				else if($4 > HEIGHT || $4 > WIDTH || $4 < 0){printf("Unvaild $4 input!");}
				else if($5 > HEIGHT || $5 > WIDTH || $5 < 0){printf("Unvaild $5 input!");}
				else{
					//draw the rectangle
					//printf("Draw RECTANGLE width is %s and height is %s at (%s,%s) ", $4, $5, $2, $3);
					rectangle($2, $3, $4, $5);
				}
			}
	|	SET_COLOR INT INT INT{

				//check the input paramters are valid
				if($2 > HEIGHT || $2 > WIDTH || $2 < 0){printf("Unvaild $2 input!");}
				else if($3 > HEIGHT || $3 > WIDTH || $3 < 0){printf("Unvaild $3 input!");}
				else if($4 > HEIGHT || $4 > WIDTH || $4 < 0){printf("Unvaild $4 input!");}
				else{
					//set the color
					//printf("Set COLOR (%s,%s, %s)", $2, $3, $4);
					set_color($2, $3, $4);
				}
			}
	|	END
	;

%%

int main(int argc, char** argv){
	setup();
	yyparse();
}

int yyerror(const char* err){
	printf("%s\n", err);
}

