%{
	#include <stdio.h>
        #include <SDL2/SDL.h>
	#include "zoomjoystrong.h"
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
				if($2 > HEIGHT || $2 > WIDTH || $2 < 0){printf("Unvaild $2 input!\n");}
				else if($3 > HEIGHT || $3 > WIDTH || $3 < 0){printf("Unvaild $3 input!\n");}
				else if($4 > HEIGHT || $4 > WIDTH || $4 < 0){printf("Unvaild $4 input!\n");}
				else if($5 > HEIGHT || $5 > WIDTH || $5 < 0){printf("Unvaild $5 input!\n");}
				else{
					//draw the line
					line($2, $3, $4, $5);
					printf("Draw LINE from (%d,%d) to (%d, %d)\n", $2, $3, $4, $5);
				}
			}
	|	POINT INT INT{

				//check the input paramters are valid
				if($2 > HEIGHT || $2 > WIDTH || $2 < 0){printf("Unvaild $2 input!\n");}
				else if($3 > HEIGHT || $3 > WIDTH || $3 < 0){printf("Unvaild $3 input!\n");}
				else{
					//draw the dot
					printf("Draw POINT at (%d,%d)\n", $2, $3);
					point($2, $3);
				}
			}
	|	CIRCLE INT INT INT{

				//check the input paramters are valid
				if($2 > HEIGHT || $2 > WIDTH || $2 < 0){printf("Unvaild $2 input!\n");}
				else if($3 > HEIGHT || $3 > WIDTH || $3 < 0){printf("Unvaild $3 input!\n");}
				else if($4 > HEIGHT || $4 > WIDTH || $4 < 0){printf("Unvaild $4 input!\n");}
				else{
					//draw the circle
					printf("Draw CIRCLE at (%d,%d) whit radio: %d\n", $2, $3, $4);
					circle($2, $3, $4);
				}
			}
	|	RECTANGLE INT INT INT INT{

				//check the input paramters are valid
				if($2 > HEIGHT || $2 > WIDTH || $2 < 0){printf("Unvaild $2 input!\n");}
				else if($3 > HEIGHT || $3 > WIDTH || $3 < 0){printf("Unvaild $3 input!\n");}
				else if($4 > HEIGHT || $4 > WIDTH || $4 < 0){printf("Unvaild $4 input!\n");}
				else if($5 > HEIGHT || $5 > WIDTH || $5 < 0){printf("Unvaild $5 input!\n");}
				else{
					//draw the rectangle
					printf("Draw RECTANGLE width is %d and height is %d at (%d,%d)\n", $4, $5, $2, $3);
					rectangle($2, $3, $4, $5);
				}
			}
	|	SET_COLOR INT INT INT{

				//check the input paramters are valid
				if($2 > 255 || $2 < 0){printf("Unvaild $2 input!\n");}
				else if($3 > 255 || $3 < 0){printf("Unvaild $3 input!\n");}
				else if($4 > 255 || $4 < 0){printf("Unvaild $4 input!\n");}
				else{
					//set the color
					printf("Set COLOR (%d,%d,%d)\n", $2, $3, $4);
					set_color($2, $3, $4);
				}
			}


	|	END{
			//end of the programe
			printf("Closing the program, please be patient.\n");
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

