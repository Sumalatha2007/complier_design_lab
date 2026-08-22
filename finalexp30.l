%{
#include <stdio.h>

int consonants = 0;
%}

%%

[b-df-hj-np-tv-zB-DF-HJ-NP-TV-Z] {
    consonants++;
}

.|\n {
}

%%

int main()
{
    yylex();

    printf("Number of consonants = %d\n", consonants);

    return 0;
}

int yywrap()
{
    return 1;
}