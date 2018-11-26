%{
    #include "ZoomJoyStrong.tab.h"
	
%}
 
%option yylineno

%%
[0-9]+				return INT;
X				return X;
Y				return Y;
U				return U;
V				return V;
R				return R;
W				return W;
H				return H;
G				return G;
B				return B;
[\.]				return POINT;
[0-9]*\.?[0-9]*			return FLOAT;
[-|_]				return LINE;
(CIRCLE|circle)			return CIRCLE;
(RECTANGLE|rectangle)		return RECTANGLE;
(SET_COLOR|set_color)		return SET_COLOR;
;				return END_STATEMENT;
(END|end)			return END;
[ |\t|\n]			;
.                               printf("%d, %s\n", yylineno, "NO_MATCH");
%%

