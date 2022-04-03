%{
#include <stdio.h>
#include <stdlib.h>
%}

%token DIGIT LETTER NL UND

%%
start: variable NL {printf("\nValid Identifier\n"); exit(0);};
variable: LETTER alnum
alnum: LETTER alnum 
| DIGIT alnum
| UND alnum
| LETTER
| DIGIT
| UND
;
%%

int yyerror(char *msg){
    printf("\nInvalid Identifier");
    exit(0);
}

int main(){
    printf("Enter varible name : ");
    yyparse();
}