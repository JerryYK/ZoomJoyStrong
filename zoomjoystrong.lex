%{
    #include "zoomjoystrong.tab.h"
    #include <stdio.h>
    #include <stdlib.h>
	
%}
 
%option yylineno
%option noyywrap

%%
[0-9]+				{yylval.ival = atoi(yytext); return INT;}
[\.]				return POINT;
[0-9]*\.?[0-9]*			{yylval.fval = atoi(yytext); return FLOAT;}
(point|POINT)			return POINT;
(LINE|line)			return LINE;
(CIRCLE|circle)			return CIRCLE;
(RECTANGLE|rectangle)		return RECTANGLE;
(SET_COLOR|set_color)		return SET_COLOR;
;				return END_STATEMENT;
(END|end)			return END;
[ |\t|\n]			;
.                               printf("%d, %s\n", yylineno, "NO_MATCH");
%%

