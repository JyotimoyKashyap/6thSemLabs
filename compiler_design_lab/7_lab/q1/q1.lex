%{
#include "y.tab.h"
%}

%%
[a-zA-Z]+ {yylval.ff = yytext; return STR;}
[-+()*/] {return yytext [0];}
[ \t\n_] {;}
%%

int yywrap(){
    return 1;
}

