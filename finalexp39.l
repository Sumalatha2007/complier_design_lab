%{
#include <stdio.h>
#include <string.h>

char oldword[] = "hello";
char newword[] = "welcome";
%}

%%

[a-zA-Z]+ {
    if(strcmp(yytext, oldword) == 0)
        printf("%s", newword);
    else
        printf("%s", yytext);
}

\n {
    printf("\n");
}

. {
    printf("%s", yytext);
}

%%

int main()
{
    printf("Enter the sentence:\n");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}