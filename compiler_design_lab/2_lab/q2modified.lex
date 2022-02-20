%{
#include<stdio.h>
#include<string.h>
char keywords[1000][1000], arithmeticOperators[1000][1000], logicalOperators[1000][1000], symbols[1000][1000];
int countKeywords = 0, countArithmetic = 0, countLogical = 0, countSymbols = 0; 
%}

%%
if|else|for|while|do|switch|int|char|float|double|long|include|main { 
    strcpy(keywords[countKeywords], yytext);
    countKeywords++;
}
"+"|"‐"|"*"|"/"|"%" {
    strcpy(arithmeticOperators[countArithmetic], yytext);
    countArithmetic++;
}
"<"|">"|"|"|"^"|"&"|"!" {
    strcpy(logicalOperators[countLogical], yytext);
    countLogical++;
}
. { 
    strcpy(symbols[countSymbols], yytext);
    countSymbols++;
}
%%

int yywrap(){
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

    // print all the lists 
    // print the list of keywords
    printf("List of keywords --> \n");
    for(int i=0; i<countKeywords; i++){
        printf("%s  " , keywords[i]);
    }
    printf("\n");

    // print the list of logical operators 
    printf("List of logical operators  --> \n");
    for(int i=0; i<countLogical; i++){
        printf("%s  " , logicalOperators[i]);
    }
    printf("\n");

    // print the list of Arithmetic operators 
    printf("List of arithemetic operators  --> \n");
    for(int i=0; i<countArithmetic; i++){
        printf("%s  " , arithmeticOperators[i]);
    }
    printf("\n");

    // print the list of Arithmetic operators 
    printf("List of symbols  --> \n");
    for(int i=0; i<countSymbols; i++){
        printf("%s  " , symbols[i]);
    }
    printf("\n");

    return 0;
}