%{
#include <stdio.h>
#include <string.h>

int max = 0;
char longest[100];
%}

%%

[a-zA-Z]+ {
    if(yyleng > max)
    {
        max = yyleng;
        strcpy(longest, yytext);
    }
}

[ \t\n]+ {
}

. {
}

%%

int main()
{
    printf("Enter a sentence:\n");
    yylex();

    printf("\nLongest word = %s\n", longest);
    printf("Length = %d\n", max);

    return 0;
}

int yywrap()
{
    return 1;
}