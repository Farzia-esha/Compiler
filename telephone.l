%{
#include<stdio.h>
%}

%%
"013"[0-9]{8} {printf("GrameenPhone:%s\n",yytext);}
"014"[0-9]{8} {printf("Banglalink\n");}
"015"[0-9]{8} {printf("Teletalk\n");}
"016"[0-9]{8} {printf("Airtel\n");}
"017"[0-9]{8} {printf("GrameenPhone\n");}
"018"[0-9]{8} {printf("Robi");}
.|\n;
%%
int yywrap() {return 1;}

int main()
{
    printf("enter phone num: ");
    yylex();
    return 0;
}
