%{
    #include "y.tab.h"
    extern int yylval;
%}

%%
[0-9]+ {
    yylval = atoi(yytext);
    return NUMBER;
}
[a-zA-Z]+ {return ID;}
[+] {return '+';}
[-] {return '-';}
[*] {return '*';}
[/] {return '/';}
[ \t]+ {;}
\n {return 0;}
. {return yytext[0];}
%%

int yywrap(){
    return 1;
}