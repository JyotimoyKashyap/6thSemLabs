%{
    #include <stdio.h>
    int flag = 0;
%}

%token NUMBER ID
%left '-''+'
%right '*''/'

%%
expression: E {
    if(!flag)
        printf("Output: %d\n", $$);
    return 0;
}

E:E'+'E {$$ = $1 + $3;}
|E'-'E {$$ = $1 - $3;}
|E'*'E {$$ = $1 * $3;}
|E'/'E {$$ = $1 / $3;}
|'-' NUMBER {$$ = -$2;}
|'-' ID {$$ = -$2;}
|'('E')' {$$ = $2;}
|NUMBER {$$ = $1;}
|ID {$$ = $1;};
%%

int main(){
    printf("Write down your expression : \n");
    yyparse();
    if(flag == 0)
        printf("VALID!");
    return 0;
}

int yyerror(){
    printf("\nINVALID\n");
    flag = 1;
    return 0;
}
