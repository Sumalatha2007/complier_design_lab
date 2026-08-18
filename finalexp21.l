%{
#include <stdio.h>

int macros = 0;
int headers = 0;
%}

%%

^[ \t]*#define[^\n]*    { macros++; }

^[ \t]*#include[^\n]*   { headers++; }

.|\n                    { }

%%

int main()
{
    yylex();

    printf("\nNumber of Macros defined = %d", macros);
    printf("\nNumber of Header files included = %d\n", headers);

    return 0;
}

int yywrap()
{
    return 1;
}