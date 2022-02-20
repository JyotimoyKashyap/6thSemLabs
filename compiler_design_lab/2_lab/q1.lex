%{
    #include<stdio.h>
%}

%%
if|else|for|while|do|switch|int|char|float|double|long {printf("Keyword detected\n ");}
"+"|"‐"|"*"|"/"|"%" { printf ("Arithmetic operator detected\n ");}
"<"|">"|"|"|"^"|"&"|"!" {printf("Logical operator detected\n ");}
. { printf ("symbol detected\n ");}
%%

yywrap(){
    return 1;
}

int main(){
    printf("Write something > ");
    yylex();
}