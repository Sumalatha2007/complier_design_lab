%{
#include <stdio.h>
%}

%%

abc     {
            printf("ABC");
        }

\n      {
            printf("\n");
        }

.       {
            printf("%s", yytext);
        }

%%

int main()
{
    printf("Enter the input: ");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}