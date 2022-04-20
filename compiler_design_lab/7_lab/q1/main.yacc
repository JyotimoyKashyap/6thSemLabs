%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int yylex();
void yyerror (char *msg);
int flag, ii, kk = 0;
%}

%union{
    char* ff;
}

%token <ff> STR
%type <ff> EE

%%
start: EE {
    flag = 0;
    kk = strlen ($1) - 1;
    if(kk%2 == 0) {
        for(ii=0; ii<=kk/2; ++ii) {
            if(!($1 [ii] == $1 [kk - ii])){
                flag = 1;
            }
        }

        if(flag == 1){
            printf("It is not a palindrome");
        }else{
            printf("It is a palindrome");
        }
    }else{
        for(ii=0; ii<kk/2; ++ii) {
            if(!($1 [ii] == $1 [kk - ii])) {
                flag = 1;
            }
        }

        if(flag == 1) {
            printf("It is a palindrome");
        }else {
            printf("It is not a palindrome");
        }
    }
}
;
EE: STR {$$ = $1;} 
;
%%

void yyerror (char *msg) {
    fprintf(stderr, "%s\n", msg);
    exit(1);
}

int main(){
    printf("Write something\n");
    yyparse();
    return 0;
}