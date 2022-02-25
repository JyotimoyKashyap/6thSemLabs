%{
#include <stdio.h>
#include <stdlib.h>
int com = 0;
%}

%s COMMENT

%%
"/*" {BEGIN COMMENT;}
<COMMENT>"*/" {BEGIN 0; com++;}
<COMMENT>. {;}
\/\/.* {com++;}
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
    printf("No. of comments : %d\n\n" ,com);

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

