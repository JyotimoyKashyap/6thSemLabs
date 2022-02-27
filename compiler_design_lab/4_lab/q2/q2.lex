%{
#include <stdio.h>
#include <stdlib.h>
int com = 0, ariOp = 0, logOp = 0, keyword = 0, identifier = 0;
%}

%s COMMENT

%%
"/*" {BEGIN COMMENT;}
<COMMENT>"*/" {BEGIN 0; com++;}
<COMMENT>. {;}
\/\/.* {com++;}
if|else|for|while|do|switch|int|char|float|double|long|const|return|main {keyword++;fprintf(yyout, "%s", yytext);}
"+"|"‐"|"*"|"/"|"%" {ariOp++;fprintf(yyout, "%s", yytext);}
"<"|">"|"|"|"^"|"&"|"!" {logOp++;fprintf(yyout, "%s", yytext);}
[a-zA-Z_][a-zA-Z0-9_]* {identifier++;fprintf(yyout, "%s", yytext);}
.|\n {fprintf(yyout, "%s", yytext);}
%%

int yywrap(){
    return 1;
}

void main(int argc, char** argv){
    if(argc != 2){
        printf("Please enter the filename\n");
        exit(0);
    }
    
    yyin = fopen(argv[1], "r");
    yyout = fopen("output.c", "w");
    yylex();

    printf("******* Program Output ********\n");
    printf("Output file created : output.c\n");
    printf("No. of comments : %d\n" ,com);
    printf("No. of logical operators : %d\n" ,logOp);
    printf("No. of arithmetic operators : %d\n" ,ariOp);
    printf("No. of keywords : %d\n" ,keyword);
    printf("No. of identifiers : %d\n" ,identifier);

    printf("\n----------------------------------------\n");
    printf("Below is the input file : \n");
    system("cat test.c");
    fclose(yyout);

    printf("\n----------------------------------------\n");

    printf("Below is the output file : \n");
    system("cat output.c");

    printf("\n");
    printf("Program Executed Successfully\n");
    
    
}

