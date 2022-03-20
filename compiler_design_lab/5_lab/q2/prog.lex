%{
    #include "y.tab.h"
%}

%%
"if" {return IF;}
[sS][0-9]* {return S;}
"<"|">"|"=="|"!="|"<="|">=" {return RELOP;}
[0-9]+ {return NUMBER;}
[a-zA-Z][a-zA-Z0-9_]* {return ID;}
[ \t]+ {;}
\n {return 0;}
. {return yytext[0];}
%%

int yywrap(){
    return 1;
}