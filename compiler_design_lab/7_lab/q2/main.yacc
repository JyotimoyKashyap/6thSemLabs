%{
#include <stdio.h>
#include <stdlib.h>
%}

%token ZERO ONE

%%
start: ACCEPT {printf("It is a valid sequence");};
ACCEPT: ZERONE | ZERO ZZ | ONE OO;
ZZ: ZERONE ZZ | ZERO;
OO: ZERONE OO | ONE;
ZERONE: ZERO | ONE;
%%

int yyerror (char* msg) {
    fprintf(stderr, "%s\n" ,msg);
    exit(1);
}

int main(){
    printf("Write something\n");
    yyparse();
    return 0;
}