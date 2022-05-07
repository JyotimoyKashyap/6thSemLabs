%{
/* Definition section */
#include<stdio.h>
#include <stdlib.h>
%}

%token ZERO ONE

/* Rule Section */
%%

r : s {printf("\nSequence Accepted\n\n");}
;

s : n
| ZERO a
| ONE b
;

a : n a
| ZERO
;

b : n b
| ONE
;

n : ZERO
| ONE
;

%%

int yyerror(char *msg){
    printf("\nSequence Rejected");
    exit(0);
}

//driver code
int main()
{
	printf("\nEnter Sequence of Zeros and Ones : ");
	yyparse();
	printf("\n");
	return 0;
}
