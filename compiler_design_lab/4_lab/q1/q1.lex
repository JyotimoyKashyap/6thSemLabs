%{
#include <stdio.h>
int com = 0;
%}

%s COMMENT

%%
"/*" {BEGIN COMMENT}
<COMMENT>"*/" {BEGIN 0; com++;}
<COMMENT>. {;}
\/\/.* {com++;}
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
    yylex();

    printf("No. of comments : %d\n" ,com);
    
}

