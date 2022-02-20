%{
#include<stdio.h>
int lc=0, wc=0, sc=0, letters=0;
%}

%%
([a-zA-Z0-9])* {++wc; letters = letters + yyleng;}
\n ++lc;
[^\w\*] {++sc;}
end return 0;
%%

int yywrap(){}

int main(){
    printf("Write something > \n");
    yylex();
    
    // print the counts 
    printf("No. of lines : %d\n" ,lc);
    printf("No. of words : %d\n" ,wc);
    printf("No. of special characters : %d\n" ,sc);
    printf("No. of letters : %d\n" ,letters);
    return 0;
}