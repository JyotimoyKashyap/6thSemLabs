%{
    #include <stdio.h>
    #include <stdlib.h>
    int count = 0;
%}

%token IF RELOP S NUMBER ID 

%%
statement: if_stat {
    printf("total nested if statements: %d\n" ,count);
    return 0;
}

if_stat: IF'('cond')''{'if_stat'}' {count++;}
|S {;}
cond: x RELOP x {;}
x: ID|NUMBER {;}
%%

int main(){
    printf("Write the statement: \n");
    yyparse();
    return 0;
}

int yyerror(char *str){
    printf("INVALID!");
    exit(0);
}