%{
#include <stdio.h>

int count = 0;
%}


identifier   [a-zA-Z_][a-zA-Z0-9_]*
keyword      int|float|char|double|long|short|void|return|if|else|while|for|do|switch|case|break|continue|struct|union|typedef

%%

{keyword}    ;

{identifier} {
    printf("Identifier: %s\n", yytext);
    count++;
}

[ \t\n]+     ;
.            ;

%%

int main()
{
    printf("Enter c program:\n");

    yylex();
    printf("\nTotal Identifiers: %d\n", count);
    return 0;
}

int yywrap()
{
    return 1;
}
