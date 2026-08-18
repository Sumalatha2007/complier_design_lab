%{
#include <stdio.h>

int whitespace = 0;
int newline = 0;
%}

%%

[ \t]+      { whitespace += yyleng; }
\n          { newline++; }
.           { }

%%

int main()
{
    printf("Enter the input:\n");
    yylex();

    printf("\nNumber of whitespaces = %d", whitespace);
    printf("\nNumber of newline characters = %d\n", newline);

    return 0;
}

int yywrap()
{
    return 1;
}