%{
#include<stdio.h>
%}

%%
if|else|for|while|do|switch|int|char|float|double|long|include|main {printf("Keyword detected\n ");}
"+"|"‐"|"*"|"/"|"%" { printf ("Arithmetic operator detected\n ");}
"<"|">"|"|"|"^"|"&"|"!" {printf("Logical operator detected\n ");}
. { printf ("symbol detected\n ");}
%%

yywrap(){
    return 1;
}

int main(int argc, char** argv){
    
    if(argc <= 1){
        printf("Please enter the filename of the C program that you want to process. (eg. ./a.out filename.c)\n ");
        return -1;
    }

    extern FILE *yyin;


    // opens the file that is supplied in the argument 
    yyin = fopen(argv[1], "r");

    yylex();
}