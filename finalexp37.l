%{
#include <stdio.h>
#include <string.h>

char search[50];
int count = 0;
%}

%%

[a-zA-Z]+ {
    if(strcmp(yytext, search) == 0)
        count++;
}

[ \t\n]+ {
}

. {
}

%%

int main()
{
    printf("Enter word to search: ");
    scanf("%s", search);

    printf("Enter sentence:\n");
    getchar();

    yylex();

    printf("\nFrequency of %s = %d\n", search, count);

    return 0;
}

int yywrap()
{
    return 1;
}