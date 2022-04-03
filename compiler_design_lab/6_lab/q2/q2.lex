%{
#include "y.tab.h"
#include <stdio.h>
%}

%%
[aA] {return A;}
[bB] {return B;}
\n {return NL;}
. {yytext[0];}
%%

int yywrap(){
    return 1;
}

