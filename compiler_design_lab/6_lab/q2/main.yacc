%{
#include <stdio.h>
#include <stdlib.h>
%}

%token A B NL 

%%
start: string NL {printf("\nValid Identifier\n"); exit(0);};
string: A string B | ;
%%

int yyerror(char *msg){
    printf("\nInvalid Identifier");
    exit(0);
}

int main(){
    printf("Enter a string : ");
    yyparse();
}