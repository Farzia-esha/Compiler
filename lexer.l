%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char output[10000];
%}

DIGIT       [0-9]
LETTER      [a-zA-Z_]
ID          {LETTER}({LETTER}|{DIGIT})*
INT         {DIGIT}+
FLOAT       {DIGIT}+"."{DIGIT}+([eE][+-]?{DIGIT}+)?
EXP         {DIGIT}+([eE][+-]?{DIGIT}+)
STRING      \"([^\"\\]|\\.)*\"
CHARCONST   \'([^\'\\]|\\.)\'

KEYWORD     int|float|char|double|long|short|void|if|else|for|while|do|switch|case|break|continue|return|struct|union|typedef|enum|static|const|sizeof

OPERATOR    \+|\-|\*|\/|\%|\=\=|\!=|\<=|\>=|\<|\>|\=|\+\+|\-\-|\&\&|\|\||\!

DELIMITER   \(|\)|\{|\}|\[|\]|;|,|\.

WHITESPACE  [ \t\n]+

%%

{KEYWORD}    { strcat(output, "Keyword: "); strcat(output, yytext); strcat(output, "\n"); }
{ID}         { strcat(output, "Identifier: "); strcat(output, yytext); strcat(output, "\n"); }
{FLOAT}      { strcat(output, "Float: "); strcat(output, yytext); strcat(output, "\n"); }
{EXP}        { strcat(output, "Exponential: "); strcat(output, yytext); strcat(output, "\n"); }
{INT}        { strcat(output, "Integer: "); strcat(output, yytext); strcat(output, "\n"); }
{STRING}     { strcat(output, "String: "); strcat(output, yytext); strcat(output, "\n"); }
{CHARCONST}  { strcat(output, "Char: "); strcat(output, yytext); strcat(output, "\n"); }
{OPERATOR}   { strcat(output, "Operator: "); strcat(output, yytext); strcat(output, "\n"); }
{DELIMITER}  { strcat(output, "Delimiter: "); strcat(output, yytext); strcat(output, "\n"); }

{WHITESPACE} ;

.            { strcat(output, "Unknown: "); strcat(output, yytext); strcat(output, "\n"); }

%%

int main()
{
    output[0] = '\0';

    printf("Enter C program:\n");
    yylex();

    printf("\nFull Output:\n");
    printf("%s", output);

    return 0;
}

int yywrap()
{
    return 1;
}
