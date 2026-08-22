%{
#include <stdio.h>
%}

%%

[0-9] {
    printf("It is a Digit\n");
}

.* {
    printf("It is Not a Digit\n");
}

\n {
}

%%

int main()
{
    printf("Enter a character:\n");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}