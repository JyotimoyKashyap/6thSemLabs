
/* lex program to recognize an alphabet from a word or a single character*/
%{
#include<stdio.h>
%}

/* Rules section */
%%
[a-zA-Z] {printf("alphabet identified \n");}
%%

int yywrap(void){
    return 0;
}

int main(){
    printf("Enter your word : ");
    yylex();
    return 0;
}