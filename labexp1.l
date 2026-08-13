%{
#include <stdio.h>
%}

%%
[ \t\n]+ ;
[a-zA-Z_][a-zA-Z0-9_]* { printf("Identifier: %s\n", yytext); }
[0-9]+ { printf("Constant: %s\n", yytext); }
"+" { printf("Operator: +\n"); }
"-" { printf("Operator: -\n"); }
"*" { printf("Operator: *\n"); }
"/" { printf("Operator: /\n"); }
"=" { printf("Operator: =\n"); }
. ;
%%

int main()
{
    printf("Enter C statement:\n");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}