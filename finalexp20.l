%{
#include <stdio.h>
%}

%%

[0-9]+(\.[0-9]+)?    {
                        printf("Constant: %s\n", yytext);
                     }

%%

int main()
{
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}