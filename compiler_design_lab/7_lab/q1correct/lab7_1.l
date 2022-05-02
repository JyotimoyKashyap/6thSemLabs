%{
    
    #include <stdio.h>
    #include <stdlib.h>
    #include "y.tab.h"
%}
  

%%
  
[a-zA-Z]+   {yylval.f = yytext; return STR;}
[-+()*/]    {return yytext[0];}
[ \t\n]      {;}
  
%%
  
 int yywrap()
 { 
  return -1; 
 }

