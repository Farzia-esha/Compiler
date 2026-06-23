%{
#include<stdio.h>
%}

%%
[0-9]+"+"[0-9]+"i"          {printf("complex num:%s\n",yytext);}
[0-9]+([eE][+-]?[0-9]+)     {printf("Exponential num:%s\n",yytext);}
[0-9]+"."[0-9]               {printf("Float num:%s\n",yytext);}
[0-9]+                      {printf("integer num:%s\n",yytext);}
[ \t\n]+                    ;
.                           ;
%%

int main()
{
    yylex();
    return 0;
}

int yywrap(){
    return 1;
}
