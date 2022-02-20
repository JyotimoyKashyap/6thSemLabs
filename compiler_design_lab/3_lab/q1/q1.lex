%{
#include<stdio.h>
int vowels=0, consonants=0;
%}

%%
"a"|"e"|"i"|"o"|"u" { vowels++; }
"A"|"E"|"I"|"O"|"U" { vowels++; }
[a-zA-Z] { consonants++; }
\n { return 0; }
%%

int yywrap(){}

int main(){
    printf("Write something > \n");
    yylex();
    
    // print the counts 
    printf("Vowels : %d\n" ,vowels);
    printf("consonants: %d\n" ,consonants);
    return 0;
}