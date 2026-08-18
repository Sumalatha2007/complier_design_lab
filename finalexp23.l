%{
#include <stdio.h>

int line = 1;
%}

%%

\n    {
        line++;
        printf("\n%4d  ", line);
      }

.     {
        printf("%s", yytext);
      }

%%

int main()
{
    printf("%4d  ", line);
    yylex();

    return 0;
}

int yywrap()
{
    return 1;
}